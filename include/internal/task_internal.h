/*
 * FreeRTOS Kernel V10.0.1
 * Copyright (C) 2017 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * http://www.FreeRTOS.org
 * http://aws.amazon.com/freertos
 *
 * 1 tab == 4 spaces!
 */


#ifndef INC_TASK_INTERNAL_H
#define INC_TASK_INTERNAL_H

#ifndef INC_FREERTOS_H
	#error "include FreeRTOS.h must appear in source files before include task.h"
#endif

/*
 * For List_t, ListItem_t
 */
#include "list.h"

/*
 * For TaskHandle_t, TimeOut_t
 */
#include <task.h> 

#ifdef __cplusplus
extern "C" {
#endif

/*-----------------------------------------------------------
 * MACROS AND DEFINITIONS
 *----------------------------------------------------------*/

/* Possible return values for eTaskConfirmSleepModeStatus(). */
typedef enum
{
	eAbortSleep = 0,		/* A task has been made ready or a context switch pended since portSUPPORESS_TICKS_AND_SLEEP() was called - abort entering a sleep mode. */
	eStandardSleep,			/* Enter a sleep mode that will not last any longer than the expected idle time. */
	eNoTasksWaitingTimeout	/* No tasks are waiting for a timeout so it is safe to enter a sleep mode that can only be exited by an external interrupt. */
} eSleepModeStatus;

/*-----------------------------------------------------------
 * SCHEDULER INTERNALS AVAILABLE FOR PORTING PURPOSES
 *----------------------------------------------------------*/

/*
 * THIS FUNCTION MUST NOT BE USED FROM APPLICATION CODE.  IT IS ONLY
 * INTENDED FOR USE WHEN IMPLEMENTING A PORT OF THE SCHEDULER AND IS
 * AN INTERFACE WHICH IS FOR THE EXCLUSIVE USE OF THE SCHEDULER.
 *
 * Called from the real time kernel tick (either preemptive or cooperative),
 * this increments the tick count and checks if any tasks that are blocked
 * for a finite period required removing from a blocked list and placing on
 * a ready list.  If a non-zero value is returned then a context switch is
 * required because either:
 *   + A task was removed from a blocked list because its timeout had expired,
 *     or
 *   + Time slicing is in use and there is a task of equal priority to the
 *     currently running task.
 */
BaseType_t xTaskIncrementTick( void ) PRIVILEGED_FUNCTION;

/*
 * THIS FUNCTION MUST NOT BE USED FROM APPLICATION CODE.  IT IS AN
 * INTERFACE WHICH IS FOR THE EXCLUSIVE USE OF THE SCHEDULER.
 *
 * THIS FUNCTION MUST BE CALLED WITH INTERRUPTS DISABLED.
 *
 * Removes the calling task from the ready list and places it both
 * on the list of tasks waiting for a particular event, and the
 * list of delayed tasks.  The task will be removed from both lists
 * and replaced on the ready list should either the event occur (and
 * there be no higher priority tasks waiting on the same event) or
 * the delay period expires.
 *
 * The 'unordered' version replaces the event list item value with the
 * xItemValue value, and inserts the list item at the end of the list.
 *
 * The 'ordered' version uses the existing event list item value (which is the
 * owning tasks priority) to insert the list item into the event list is task
 * priority order.
 *
 * @param pxEventList The list containing tasks that are blocked waiting
 * for the event to occur.
 *
 * @param xItemValue The item value to use for the event list item when the
 * event list is not ordered by task priority.
 *
 * @param xTicksToWait The maximum amount of time that the task should wait
 * for the event to occur.  This is specified in kernel ticks,the constant
 * portTICK_PERIOD_MS can be used to convert kernel ticks into a real time
 * period.
 */
void vTaskPlaceOnEventList( List_t * const pxEventList, const TickType_t xTicksToWait ) PRIVILEGED_FUNCTION;
void vTaskPlaceOnUnorderedEventList( List_t * pxEventList, const TickType_t xItemValue, const TickType_t xTicksToWait ) PRIVILEGED_FUNCTION;

/*
 * THIS FUNCTION MUST NOT BE USED FROM APPLICATION CODE.  IT IS AN
 * INTERFACE WHICH IS FOR THE EXCLUSIVE USE OF THE SCHEDULER.
 *
 * THIS FUNCTION MUST BE CALLED WITH INTERRUPTS DISABLED.
 *
 * This function performs nearly the same function as vTaskPlaceOnEventList().
 * The difference being that this function does not permit tasks to block
 * indefinitely, whereas vTaskPlaceOnEventList() does.
 *
 */
void vTaskPlaceOnEventListRestricted( List_t * const pxEventList, TickType_t xTicksToWait, const BaseType_t xWaitIndefinitely ) PRIVILEGED_FUNCTION;

/*
 * THIS FUNCTION MUST NOT BE USED FROM APPLICATION CODE.  IT IS AN
 * INTERFACE WHICH IS FOR THE EXCLUSIVE USE OF THE SCHEDULER.
 *
 * THIS FUNCTION MUST BE CALLED WITH INTERRUPTS DISABLED.
 *
 * Removes a task from both the specified event list and the list of blocked
 * tasks, and places it on a ready queue.
 *
 * xTaskRemoveFromEventList()/vTaskRemoveFromUnorderedEventList() will be called
 * if either an event occurs to unblock a task, or the block timeout period
 * expires.
 *
 * xTaskRemoveFromEventList() is used when the event list is in task priority
 * order.  It removes the list item from the head of the event list as that will
 * have the highest priority owning task of all the tasks on the event list.
 * vTaskRemoveFromUnorderedEventList() is used when the event list is not
 * ordered and the event list items hold something other than the owning tasks
 * priority.  In this case the event list item value is updated to the value
 * passed in the xItemValue parameter.
 *
 * @return pdTRUE if the task being removed has a higher priority than the task
 * making the call, otherwise pdFALSE.
 */
BaseType_t xTaskRemoveFromEventList( const List_t * const pxEventList ) PRIVILEGED_FUNCTION;
void vTaskRemoveFromUnorderedEventList( ListItem_t * pxEventListItem, const TickType_t xItemValue ) PRIVILEGED_FUNCTION;

/*
 * THIS FUNCTION MUST NOT BE USED FROM APPLICATION CODE.  IT IS ONLY
 * INTENDED FOR USE WHEN IMPLEMENTING A PORT OF THE SCHEDULER AND IS
 * AN INTERFACE WHICH IS FOR THE EXCLUSIVE USE OF THE SCHEDULER.
 *
 * Sets the pointer to the current TCB to the TCB of the highest priority task
 * that is ready to run.
 */
void vTaskSwitchContext( void ) PRIVILEGED_FUNCTION;

/*
 * THESE FUNCTIONS MUST NOT BE USED FROM APPLICATION CODE.  THEY ARE USED BY
 * THE EVENT BITS MODULE.
 */
TickType_t uxTaskResetEventItemValue( void ) PRIVILEGED_FUNCTION;

/*
 * Return the handle of the calling task.
 */
TaskHandle_t xTaskGetCurrentTaskHandle( void ) PRIVILEGED_FUNCTION;

/*
 * Capture the current time status for future reference.
 */
void vTaskSetTimeOutState( TimeOut_t * const pxTimeOut ) PRIVILEGED_FUNCTION;

/*
 * Compare the time status now with that previously captured to see if the
 * timeout has expired.
 */
BaseType_t xTaskCheckForTimeOut( TimeOut_t * const pxTimeOut, TickType_t * const pxTicksToWait ) PRIVILEGED_FUNCTION;

/*
 * Shortcut used by the queue implementation to prevent unnecessary call to
 * taskYIELD();
 */
void vTaskMissedYield( void ) PRIVILEGED_FUNCTION;

/*
 * Returns the scheduler state as taskSCHEDULER_RUNNING,
 * taskSCHEDULER_NOT_STARTED or taskSCHEDULER_SUSPENDED.
 */
BaseType_t xTaskGetSchedulerState( void ) PRIVILEGED_FUNCTION;

/*
 * Raises the priority of the mutex holder to that of the calling task should
 * the mutex holder have a priority less than the calling task.
 */
BaseType_t xTaskPriorityInherit( TaskHandle_t const pxMutexHolder ) PRIVILEGED_FUNCTION;

/*
 * Set the priority of a task back to its proper priority in the case that it
 * inherited a higher priority while it was holding a semaphore.
 */
BaseType_t xTaskPriorityDisinherit( TaskHandle_t const pxMutexHolder ) PRIVILEGED_FUNCTION;

/*
 * If a higher priority task attempting to obtain a mutex caused a lower
 * priority task to inherit the higher priority task's priority - but the higher
 * priority task then timed out without obtaining the mutex, then the lower
 * priority task will disinherit the priority again - but only down as far as
 * the highest priority task that is still waiting for the mutex (if there were
 * more than one task waiting for the mutex).
 */
void vTaskPriorityDisinheritAfterTimeout( TaskHandle_t const pxMutexHolder, UBaseType_t uxHighestPriorityWaitingTask ) PRIVILEGED_FUNCTION;

/*
 * Get the uxTCBNumber assigned to the task referenced by the xTask parameter.
 */
UBaseType_t uxTaskGetTaskNumber( TaskHandle_t xTask ) PRIVILEGED_FUNCTION;

/*
 * Set the uxTaskNumber of the task referenced by the xTask parameter to
 * uxHandle.
 */
void vTaskSetTaskNumber( TaskHandle_t xTask, const UBaseType_t uxHandle ) PRIVILEGED_FUNCTION;

/*
 * Only available when configUSE_TICKLESS_IDLE is set to 1.
 * If tickless mode is being used, or a low power mode is implemented, then
 * the tick interrupt will not execute during idle periods.  When this is the
 * case, the tick count value maintained by the scheduler needs to be kept up
 * to date with the actual execution time by being skipped forward by a time
 * equal to the idle period.
 */
void vTaskStepTick( const TickType_t xTicksToJump ) PRIVILEGED_FUNCTION;

/*
 * Only avilable when configUSE_TICKLESS_IDLE is set to 1.
 * Provided for use within portSUPPRESS_TICKS_AND_SLEEP() to allow the port
 * specific sleep function to determine if it is ok to proceed with the sleep,
 * and if it is ok to proceed, if it is ok to sleep indefinitely.
 *
 * This function is necessary because portSUPPRESS_TICKS_AND_SLEEP() is only
 * called with the scheduler suspended, not from within a critical section.  It
 * is therefore possible for an interrupt to request a context switch between
 * portSUPPRESS_TICKS_AND_SLEEP() and the low power mode actually being
 * entered.  eTaskConfirmSleepModeStatus() should be called from a short
 * critical section between the timer being stopped and the sleep mode being
 * entered to ensure it is ok to proceed into the sleep mode.
 */
eSleepModeStatus eTaskConfirmSleepModeStatus( void ) PRIVILEGED_FUNCTION;

/*
 * For internal use only.  Increment the mutex held count when a mutex is
 * taken and return the handle of the task that has taken the mutex.
 */
void *pvTaskIncrementMutexHeldCount( void ) PRIVILEGED_FUNCTION;

/*
 * For internal use only.  Same as vTaskSetTimeOutState(), but without a critial
 * section.
 */
void vTaskInternalSetTimeOutState( TimeOut_t * const pxTimeOut ) PRIVILEGED_FUNCTION;


#ifdef __cplusplus
}
#endif
#endif /* INC_TASK_INTERNAL_H */
