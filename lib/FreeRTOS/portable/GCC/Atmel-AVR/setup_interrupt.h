#ifndef SETUP_INTERRUPT_H
#define SETUP_INTERRUPT_H

#ifdef __cplusplus
extern "C" {
#endif

#if (defined __AVR_ATmega88__ || defined __AVR_ATmega48__ || defined __AVR_ATmega168__)
#include "avr4_interrupt.h"
#endif /* defined __AVR_ATmega88__ || defined __AVR_ATmega48__ || defined __AVR_ATmega168__ */

#ifdef __cplusplus
}
#endif

#endif /* SETUP_INTERRUPT_H */

