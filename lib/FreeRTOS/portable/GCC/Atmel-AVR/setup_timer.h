#ifndef SETUP_TIMER_H
#define SETUP_TIMER_H

#ifdef __cplusplus
extern "C" {
#endif

#if (defined __AVR_ATmega88__ || defined __AVR_ATmega48__ || defined __AVR_ATmega168__)
#include "avr4_timer.h"
#endif /* defined __AVR_ATmega88__ || defined __AVR_ATmega48__ || defined __AVR_ATmega168__ */

#ifdef __cplusplus
}
#endif

#endif /* SETUP_TIMER_H */

