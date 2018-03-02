#
# config.h.in configuration follows
#

option(configUSE_PREEMPTION "" ON)
if (configUSE_PREEMPTION)
	set(configUSE_PREEMPTION_Value "1" CACHE INTERNAL "")
else (configUSE_PREEMPTION)
	set(configUSE_PREEMPTION_Value "0" CACHE INTERNAL "")
endif(configUSE_PREEMPTION)

option(configUSE_PORT_OPTIMISED_TASK_SELECTION "" OFF)
if (configUSE_PORT_OPTIMISED_TASK_SELECTION)
	set(configUSE_PORT_OPTIMISED_TASK_SELECTION_Value "1" CACHE INTERNAL "")
else (configUSE_PORT_OPTIMISED_TASK_SELECTION)
	set(configUSE_PORT_OPTIMISED_TASK_SELECTION_Value "0" CACHE INTERNAL "")
endif(configUSE_PORT_OPTIMISED_TASK_SELECTION)

option(configUSE_TICKLESS_IDLE "" OFF)
if (configUSE_TICKLESS_IDLE)
	set(configUSE_TICKLESS_IDLE_Value "1" CACHE INTERNAL "")
else (configUSE_TICKLESS_IDLE)
	set(configUSE_TICKLESS_IDLE_Value "0" CACHE INTERNAL "")
endif(configUSE_TICKLESS_IDLE)

set(configCPU_CLOCK_HZ "8000000" CACHE STRING "")
set(configTICK_RATE_HZ "1000" CACHE STRING "")
set(configMAX_PRIORITIES "3" CACHE STRING "")
set(configMINIMAL_STACK_SIZE "60" CACHE STRING "")
set(configMAX_TASK_NAME_LEN "1" CACHE STRING "")

option(configUSE_16_BIT_TICKS "" ON)
if (configUSE_16_BIT_TICKS)
	set(configUSE_16_BIT_TICKS_Value "1" CACHE INTERNAL "")
else (configUSE_16_BIT_TICKS)
	set(configUSE_16_BIT_TICKS_Value "0" CACHE INTERNAL "")
endif(configUSE_16_BIT_TICKS)

option(configIDLE_SHOULD_YIELD "" ON)
if (configIDLE_SHOULD_YIELD)
	set(configIDLE_SHOULD_YIELD_Value "1" CACHE INTERNAL "")
else (configIDLE_SHOULD_YIELD)
	set(configIDLE_SHOULD_YIELD_Value "0" CACHE INTERNAL "")
endif(configIDLE_SHOULD_YIELD)

option(configUSE_TASK_NOTIFICATIONS "" OFF)
if (configUSE_TASK_NOTIFICATIONS)
	set(configUSE_TASK_NOTIFICATIONS_Value "1" CACHE INTERNAL "")
else (configUSE_TASK_NOTIFICATIONS)
	set(configUSE_TASK_NOTIFICATIONS_Value "0" CACHE INTERNAL "")
endif(configUSE_TASK_NOTIFICATIONS)

option(configUSE_MUTEXES "" OFF)
if (configUSE_MUTEXES)
	set(configUSE_MUTEXES_Value "1" CACHE INTERNAL "")
else (configUSE_MUTEXES)
	set(configUSE_MUTEXES_Value "0" CACHE INTERNAL "")
endif(configUSE_MUTEXES)

option(configUSE_RECURSIVE_MUTEXES "" OFF)
if (configUSE_RECURSIVE_MUTEXES)
	set(configUSE_RECURSIVE_MUTEXES_Value "1" CACHE INTERNAL "")
else (configUSE_RECURSIVE_MUTEXES)
	set(configUSE_RECURSIVE_MUTEXES_Value "0" CACHE INTERNAL "")
endif(configUSE_RECURSIVE_MUTEXES)

option(configUSE_COUNTING_SEMAPHORES "" OFF)
if (configUSE_COUNTING_SEMAPHORES)
	set(configUSE_COUNTING_SEMAPHORES_Value "1" CACHE INTERNAL "")
else (configUSE_COUNTING_SEMAPHORES)
	set(configUSE_COUNTING_SEMAPHORES_Value "0" CACHE INTERNAL "")
endif(configUSE_COUNTING_SEMAPHORES)

set(configQUEUE_REGISTRY_SIZE "0" CACHE STRING "")

option(configUSE_QUEUE_SETS "" OFF)
if (configUSE_QUEUE_SETS)
	set(configUSE_QUEUE_SETS_Value "1" CACHE INTERNAL "")
else (configUSE_QUEUE_SETS)
	set(configUSE_QUEUE_SETS_Value "0" CACHE INTERNAL "")
endif(configUSE_QUEUE_SETS)

option(configUSE_TIME_SLICING "" ON)
if (configUSE_TIME_SLICING)
	set(configUSE_TIME_SLICING_Value "1" CACHE INTERNAL "")
else (configUSE_TIME_SLICING)
	set(configUSE_TIME_SLICING_Value "0" CACHE INTERNAL "")
endif(configUSE_TIME_SLICING)

option(configUSE_NEWLIB_REENTRANT "" OFF)
if (configUSE_NEWLIB_REENTRANT)
	set(configUSE_NEWLIB_REENTRANT_Value "1" CACHE INTERNAL "")
else (configUSE_NEWLIB_REENTRANT)
	set(configUSE_NEWLIB_REENTRANT_Value "0" CACHE INTERNAL "")
endif(configUSE_NEWLIB_REENTRANT)

option(configENABLE_BACKWARD_COMPATIBILITY "" OFF)
if (configENABLE_BACKWARD_COMPATIBILITY)
	set(configENABLE_BACKWARD_COMPATIBILITY_Value "1" CACHE INTERNAL "")
else (configENABLE_BACKWARD_COMPATIBILITY)
	set(configENABLE_BACKWARD_COMPATIBILITY_Value "0" CACHE INTERNAL "")
endif(configENABLE_BACKWARD_COMPATIBILITY)

set(configNUM_THREAD_LOCAL_STORAGE_POINTERS "0" CACHE STRING "")

option(configSUPPORT_STATIC_ALLOCATION "" OFF)
if (configSUPPORT_STATIC_ALLOCATION)
	set(configSUPPORT_STATIC_ALLOCATION_Value "1" CACHE INTERNAL "")
else (configSUPPORT_STATIC_ALLOCATION)
	set(configSUPPORT_STATIC_ALLOCATION_Value "0" CACHE INTERNAL "")
endif(configSUPPORT_STATIC_ALLOCATION)

option(configSUPPORT_DYNAMIC_ALLOCATION "" ON)
if (configSUPPORT_DYNAMIC_ALLOCATION)
	set(configSUPPORT_DYNAMIC_ALLOCATION_Value "1" CACHE INTERNAL "")
else (configSUPPORT_DYNAMIC_ALLOCATION)
	set(configSUPPORT_DYNAMIC_ALLOCATION_Value "0" CACHE INTERNAL "")
endif(configSUPPORT_DYNAMIC_ALLOCATION)

set(configTOTAL_HEAP_SIZE "512" CACHE STRING "")

option(configAPPLICATION_ALLOCATED_HEAP "" OFF)
if (configAPPLICATION_ALLOCATED_HEAP)
	set(configAPPLICATION_ALLOCATED_HEAP_Value "1" CACHE INTERNAL "")
else (configAPPLICATION_ALLOCATED_HEAP)
	set(configAPPLICATION_ALLOCATED_HEAP_Value "0" CACHE INTERNAL "")
endif(configAPPLICATION_ALLOCATED_HEAP)

option(configUSE_IDLE_HOOK "" OFF)
if (configUSE_IDLE_HOOK)
	set(configUSE_IDLE_HOOK_Value "1" CACHE INTERNAL "")
else (configUSE_IDLE_HOOK)
	set(configUSE_IDLE_HOOK_Value "0" CACHE INTERNAL "")
endif(configUSE_IDLE_HOOK)

option(configUSE_TICK_HOOK "" OFF)
if (configUSE_TICK_HOOK)
	set(configUSE_TICK_HOOK_Value "1" CACHE INTERNAL "")
else (configUSE_TICK_HOOK)
	set(configUSE_TICK_HOOK_Value "0" CACHE INTERNAL "")
endif(configUSE_TICK_HOOK)

set(configCHECK_FOR_STACK_OVERFLOW "2" CACHE STRING "")

option(configUSE_MALLOC_FAILED_HOOK "" OFF)
if (configUSE_MALLOC_FAILED_HOOK)
	set(configUSE_MALLOC_FAILED_HOOK_Value "1" CACHE INTERNAL "")
else (configUSE_MALLOC_FAILED_HOOK)
	set(configUSE_MALLOC_FAILED_HOOK_Value "0" CACHE INTERNAL "")
endif(configUSE_MALLOC_FAILED_HOOK)

option(configUSE_DAEMON_TASK_STARTUP_HOOK "" OFF)
if (configUSE_DAEMON_TASK_STARTUP_HOOK)
	set(configUSE_DAEMON_TASK_STARTUP_HOOK_Value "1" CACHE INTERNAL "")
else (configUSE_DAEMON_TASK_STARTUP_HOOK)
	set(configUSE_DAEMON_TASK_STARTUP_HOOK_Value "0" CACHE INTERNAL "")
endif(configUSE_DAEMON_TASK_STARTUP_HOOK)

option(configGENERATE_RUN_TIME_STATS "" OFF)
if (configGENERATE_RUN_TIME_STATS)
	set(configGENERATE_RUN_TIME_STATS_Value "1" CACHE INTERNAL "")
else (configGENERATE_RUN_TIME_STATS)
	set(configGENERATE_RUN_TIME_STATS_Value "0" CACHE INTERNAL "")
endif(configGENERATE_RUN_TIME_STATS)

option(configUSE_TRACE_FACILITY "" OFF)
if (configUSE_TRACE_FACILITY)
	set(configUSE_TRACE_FACILITY_Value "1" CACHE INTERNAL "")
else (configUSE_TRACE_FACILITY)
	set(configUSE_TRACE_FACILITY_Value "0" CACHE INTERNAL "")
endif(configUSE_TRACE_FACILITY)

option(configUSE_STATS_FORMATTING_FUNCTIONS "" OFF)
if (configUSE_STATS_FORMATTING_FUNCTIONS)
	set(configUSE_STATS_FORMATTING_FUNCTIONS_Value "1" CACHE INTERNAL "")
else (configUSE_STATS_FORMATTING_FUNCTIONS)
	set(configUSE_STATS_FORMATTING_FUNCTIONS_Value "0" CACHE INTERNAL "")
endif(configUSE_STATS_FORMATTING_FUNCTIONS)

option(configUSE_CO_ROUTINES "" OFF)
if (configUSE_CO_ROUTINES)
	set(configUSE_CO_ROUTINES_Value "1" CACHE INTERNAL "")
else (configUSE_CO_ROUTINES)
	set(configUSE_CO_ROUTINES_Value "0" CACHE INTERNAL "")
endif(configUSE_CO_ROUTINES)

set(configMAX_CO_ROUTINE_PRIORITIES "0" CACHE STRING "")

option(configUSE_TIMERS "" OFF)
if (configUSE_TIMERS)
	set(configUSE_TIMERS_Value "1" CACHE INTERNAL "")
else (configUSE_TIMERS)
	set(configUSE_TIMERS_Value "0" CACHE INTERNAL "")
endif(configUSE_TIMERS)

set(configTIMER_TASK_PRIORITY "0" CACHE STRING "")
set(configTIMER_QUEUE_LENGTH "0" CACHE STRING "")

set(configTIMER_TASK_STACK_DEPTH "0" CACHE STRING "")

set(configKERNEL_INTERRUPT_PRIORITY "0" CACHE STRING "")
set(configMAX_SYSCALL_INTERRUPT_PRIORITY "0" CACHE STRING "")
set(configMAX_API_CALL_INTERRUPT_PRIORITY "0" CACHE STRING "")

option(configINCLUDE_APPLICATION_DEFINED_PRIVILEGED_FUNCTIONS "" OFF)
if (configINCLUDE_APPLICATION_DEFINED_PRIVILEGED_FUNCTIONS)
	set(configINCLUDE_APPLICATION_DEFINED_PRIVILEGED_FUNCTIONS_Value "1" CACHE INTERNAL "")
else (configINCLUDE_APPLICATION_DEFINED_PRIVILEGED_FUNCTIONS)
	set(configINCLUDE_APPLICATION_DEFINED_PRIVILEGED_FUNCTIONS_Value "0" CACHE INTERNAL "")
endif(configINCLUDE_APPLICATION_DEFINED_PRIVILEGED_FUNCTIONS)

option(INCLUDE_vTaskPrioritySet "" OFF)
if (INCLUDE_vTaskPrioritySet)
	set(INCLUDE_vTaskPrioritySet_Value "1" CACHE INTERNAL "")
else (INCLUDE_vTaskPrioritySet)
	set(INCLUDE_vTaskPrioritySet_Value "0" CACHE INTERNAL "")
endif(INCLUDE_vTaskPrioritySet)

option(INCLUDE_uxTaskPriorityGet "" OFF)
if (INCLUDE_uxTaskPriorityGet)
	set(INCLUDE_uxTaskPriorityGet_Value "1" CACHE INTERNAL "")
else (INCLUDE_uxTaskPriorityGet)
	set(INCLUDE_uxTaskPriorityGet_Value "0" CACHE INTERNAL "")
endif(INCLUDE_uxTaskPriorityGet)

option(INCLUDE_vTaskDelete "" OFF)
if (INCLUDE_vTaskDelete)
	set(INCLUDE_vTaskDelete_Value "1" CACHE INTERNAL "")
else (INCLUDE_vTaskDelete)
	set(INCLUDE_vTaskDelete_Value "0" CACHE INTERNAL "")
endif(INCLUDE_vTaskDelete)

option(INCLUDE_vTaskSuspend "" ON)
if (INCLUDE_vTaskSuspend)
	set(INCLUDE_vTaskSuspend_Value "1" CACHE INTERNAL "")
else (INCLUDE_vTaskSuspend)
	set(INCLUDE_vTaskSuspend_Value "0" CACHE INTERNAL "")
endif(INCLUDE_vTaskSuspend)

option(INCLUDE_xResumeFromISR "" ON)
if (INCLUDE_xResumeFromISR)
	set(INCLUDE_xResumeFromISR_Value "1" CACHE INTERNAL "")
else (INCLUDE_xResumeFromISR)
	set(INCLUDE_xResumeFromISR_Value "0" CACHE INTERNAL "")
endif(INCLUDE_xResumeFromISR)

option(INCLUDE_vTaskDelayUntil "" OFF)
if (INCLUDE_vTaskDelayUntil)
	set(INCLUDE_vTaskDelayUntil_Value "1" CACHE INTERNAL "")
else (INCLUDE_vTaskDelayUntil)
	set(INCLUDE_vTaskDelayUntil_Value "0" CACHE INTERNAL "")
endif(INCLUDE_vTaskDelayUntil)

option(INCLUDE_vTaskDelay "" ON)
if (INCLUDE_vTaskDelay)
	set(INCLUDE_vTaskDelay_Value "1" CACHE INTERNAL "")
else (INCLUDE_vTaskDelay)
	set(INCLUDE_vTaskDelay_Value "0" CACHE INTERNAL "")
endif(INCLUDE_vTaskDelay)

option(INCLUDE_xTaskGetSchedulerState "" OFF)
if (INCLUDE_xTaskGetSchedulerState)
	set(INCLUDE_xTaskGetSchedulerState_Value "1" CACHE INTERNAL "")
else (INCLUDE_xTaskGetSchedulerState)
	set(INCLUDE_xTaskGetSchedulerState_Value "0" CACHE INTERNAL "")
endif(INCLUDE_xTaskGetSchedulerState)

option(INCLUDE_xTaskGetCurrentTaskHandle "" OFF)
if (INCLUDE_xTaskGetCurrentTaskHandle)
	set(INCLUDE_xTaskGetCurrentTaskHandle_Value "1" CACHE INTERNAL "")
else (INCLUDE_xTaskGetCurrentTaskHandle)
	set(INCLUDE_xTaskGetCurrentTaskHandle_Value "0" CACHE INTERNAL "")
endif(INCLUDE_xTaskGetCurrentTaskHandle)

option(INCLUDE_uxTaskGetStackHighWaterMark "" ON)
if (INCLUDE_uxTaskGetStackHighWaterMark)
	set(INCLUDE_uxTaskGetStackHighWaterMark_Value "1" CACHE INTERNAL "")
else (INCLUDE_uxTaskGetStackHighWaterMark)
	set(INCLUDE_uxTaskGetStackHighWaterMark_Value "0" CACHE INTERNAL "")
endif(INCLUDE_uxTaskGetStackHighWaterMark)

option(INCLUDE_xTaskGetIdleTaskHandle "" OFF)
if (INCLUDE_xTaskGetIdleTaskHandle)
	set(INCLUDE_xTaskGetIdleTaskHandle_Value "1" CACHE INTERNAL "")
else (INCLUDE_xTaskGetIdleTaskHandle)
	set(INCLUDE_xTaskGetIdleTaskHandle_Value "0" CACHE INTERNAL "")
endif(INCLUDE_xTaskGetIdleTaskHandle)

option(INCLUDE_eTaskGetState "" OFF)
if (INCLUDE_eTaskGetState)
	set(INCLUDE_eTaskGetState_Value "1" CACHE INTERNAL "")
else (INCLUDE_eTaskGetState)
	set(INCLUDE_eTaskGetState_Value "0" CACHE INTERNAL "")
endif(INCLUDE_eTaskGetState)

option(INCLUDE_xEventGroupSetBitFromISR "" OFF)
if (INCLUDE_xEventGroupSetBitFromISR)
	set(INCLUDE_xEventGroupSetBitFromISR_Value "1" CACHE INTERNAL "")
else (INCLUDE_xEventGroupSetBitFromISR)
	set(INCLUDE_xEventGroupSetBitFromISR_Value "0" CACHE INTERNAL "")
endif(INCLUDE_xEventGroupSetBitFromISR)

option(INCLUDE_xTimerPendFunctionCall "" OFF)
if (INCLUDE_xTimerPendFunctionCall)
	set(INCLUDE_xTimerPendFunctionCall_Value "1" CACHE INTERNAL "")
else (INCLUDE_xTimerPendFunctionCall)
	set(INCLUDE_xTimerPendFunctionCall_Value "0" CACHE INTERNAL "")
endif(INCLUDE_xTimerPendFunctionCall)

option(INCLUDE_xTaskAbortDelay "" OFF)
if (INCLUDE_xTaskAbortDelay)
	set(INCLUDE_xTaskAbortDelay_Value "1" CACHE INTERNAL "")
else (INCLUDE_xTaskAbortDelay)
	set(INCLUDE_xTaskAbortDelay_Value "0" CACHE INTERNAL "")
endif(INCLUDE_xTaskAbortDelay)

option(INCLUDE_xTaskGetHandle "" OFF)
if (INCLUDE_xTaskGetHandle)
	set(INCLUDE_xTaskGetHandle_Value "1" CACHE INTERNAL "")
else (INCLUDE_xTaskGetHandle)
	set(INCLUDE_xTaskGetHandle_Value "0" CACHE INTERNAL "")
endif(INCLUDE_xTaskGetHandle)

option(INCLUDE_xTaskResumeFromISR "" OFF)
if (INCLUDE_xTaskResumeFromISR)
	set(INCLUDE_xTaskResumeFromISR_Value "1" CACHE INTERNAL "")
else (INCLUDE_xTaskResumeFromISR)
	set(INCLUDE_xTaskResumeFromISR_Value "0" CACHE INTERNAL "")
endif(INCLUDE_xTaskResumeFromISR)
