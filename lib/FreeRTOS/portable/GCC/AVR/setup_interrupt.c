#include <avr/interrupt.h>
#include "FreeRTOS.h"
#include "context_macros.h"
#include "setup_interrupt.h"

#if configUSE_PREEMPTION == 1

	/*
	 * Tick ISR for preemptive scheduler.  We can use a naked attribute as
	 * the context is saved at the start of portSAVE_CONTEXT().  The tick
	 * count is incremented after the context is saved.
	 */
	ISR(PORT_TIMER_INTERRUPT_VECTOR, ISR_NAKED)
	{
	    portSAVE_CONTEXT();
	    if( xTaskIncrementTick() != pdFALSE )
	    {
		vTaskSwitchContext();
	    }
	    portRESTORE_CONTEXT();
	    asm volatile ( "reti" );
	}
#else

	/*
	 * Tick ISR for the cooperative scheduler.  All this does is increment the
	 * tick count.  We don't need to switch context, this can only be done by
	 * manual calls to taskYIELD();
	 */
	ISR(PORT_TIMER_INTERRUPT_VECTOR)
	{
		xTaskIncrementTick();
	}
#endif

