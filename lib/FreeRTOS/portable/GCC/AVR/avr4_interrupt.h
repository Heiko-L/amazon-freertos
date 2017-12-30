#ifndef AVR4_INTERRUPT_H
#define AVR4_INTERRUPT_H

#ifdef __cplusplus
extern "C" {
#endif

#if (PORT_AVR_TIMER == 0)
#define PORT_TIMER_INTERRUPT_VECTOR TIMER0_COMPA_vect
#endif (PORT_AVR_TIMER == 0)

#if (PORT_AVR_TIMER == 1)
#define PORT_TIMER_INTERRUPT_VECTOR TIMER1_COMPA_vect
#endif (PORT_AVR_TIMER == 1)

#if (PORT_AVR_TIMER == 2)
#define PORT_TIMER_INTERRUPT_VECTOR TIMER2_COMPA_vect
#endif (PORT_AVR_TIMER == 2)

#ifdef __cplusplus
}
#endif

#endif /* AVR4_INTERRUPT_H */

