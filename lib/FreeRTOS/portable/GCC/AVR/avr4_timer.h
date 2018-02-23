/*
 * avr4.h
 *
 *  Created on: 19.12.2017
 *      Author: Heiko-L
 */

#ifndef AVR4_TIMER_H
#define AVR4_TIMER_H

#include <avr/io.h>
#include "FreeRTOS.h"
#include <FreeRTOS_uc.h>

#define COMPA1024   (uint16_t)( (uint32_t)configCPU_CLOCK_HZ / ( (uint32_t)configTICK_RATE_HZ * (uint32_t)1024 ) - 1 )
#define COMPA256    (uint16_t)( (uint32_t)configCPU_CLOCK_HZ / ( (uint32_t)configTICK_RATE_HZ * (uint32_t)256 ) - 1 )
#define COMPA128    (uint16_t)( (uint32_t)configCPU_CLOCK_HZ / ( (uint32_t)configTICK_RATE_HZ * (uint32_t)128 ) - 1 )
#define COMPA64     (uint16_t)( (uint32_t)configCPU_CLOCK_HZ / ( (uint32_t)configTICK_RATE_HZ * (uint32_t)64 ) - 1 )
#define COMPA32     (uint16_t)( (uint32_t)configCPU_CLOCK_HZ / ( (uint32_t)configTICK_RATE_HZ * (uint32_t)32 ) - 1 )
#define COMPA8      (uint16_t)( (uint32_t)configCPU_CLOCK_HZ / ( (uint32_t)configTICK_RATE_HZ * (uint32_t)8 ) - 1 )
#define COMPA1      (uint16_t)( (uint32_t)configCPU_CLOCK_HZ / ( (uint32_t)configTICK_RATE_HZ ) - 1 )

#if (PORT_AVR_TIMER == 0)
#define PORT_AVR_COMP_MAX_INDEX 3
static const uint16_t usOCArray[PORT_AVR_COMP_MAX_INDEX] = {COMPA1024,
    COMPA256, COMPA64};
static const uint16_t usPreScaler[PORT_AVR_COMP_MAX_INDEX] = {1024, 256, 64};
#endif /* PORT_AVR_TIMER == 0  */

#if (PORT_AVR_TIMER == 1)
#define PORT_AVR_COMP_MAX_INDEX 5
static const uint16_t usOCArray[PORT_AVR_COMP_MAX_INDEX] = { COMPA1024,
        COMPA256, COMPA64, COMPA8, COMPA1 };
static const uint16_t usPreScaler[PORT_AVR_COMP_MAX_INDEX] = { 1024, 256, 64, 8,
        1 };
#endif /* PORT_AVR_TIMER == 1  */

#if (PORT_AVR_TIMER == 2)
#define PORT_AVR_COMP_MAX_INDEX 7
static const uint16_t usOCArray[PORT_AVR_COMP_MAX_INDEX] = {COMPA1024,
    COMPA256, COMPA128, COMPA64, COMPA32, COMPA8, COMPA1};
static const uint16_t usPreScaler[PORT_AVR_COMP_MAX_INDEX] = {1024, 256, 128,
    64, 32, 8, 1};
#endif /* PORT_AVR_TIMER == 2  */

static void vFindBestTimerValues(uint16_t *pusOutputCompareValue,
        uint8_t *pucPrescalerIndex) {

    uint32_t ulCalcTemp;
    uint16_t sError = UINT16_MAX;
    uint16_t usErrorOld = UINT16_MAX;
    uint8_t ucIndex, usLowestErrorIndex = 0;

    for (ucIndex = 0; ucIndex < PORT_AVR_COMP_MAX_INDEX; ucIndex++) {

#if ((PORT_AVR_TIMER == 0) || (PORT_AVR_TIMER == 2))
        if ((usOCArray[ucIndex] != 0) && (usOCArray[ucIndex] <= 255)) {
#else
        if (usOCArray[ucIndex] != 0) {
#endif /*  ((PORT_AVR_TIMER == 0) || (PORT_AVR_TIMER == 2)) */


            /* calculate interrupt frequency */
            ulCalcTemp = (uint32_t) configCPU_CLOCK_HZ
                    / (uint32_t) usPreScaler[ucIndex];
            ulCalcTemp = ulCalcTemp
                    / ((uint32_t) usOCArray[ucIndex] + (uint32_t) 1);

            /* ulCalcTemp is always >= configTICK_RATE_HZ */
            sError = (uint16_t) ulCalcTemp - (uint16_t) configTICK_RATE_HZ;

            /* by using < and not <= the highest possible prescaler value will be chosen*/
            if (sError < usErrorOld) {
                usLowestErrorIndex = ucIndex;
                usErrorOld = sError;
            }
        }
    }
    *pusOutputCompareValue = usOCArray[usLowestErrorIndex];
    *pucPrescalerIndex = usLowestErrorIndex;
}

#if (PORT_AVR_TIMER == 0)
static inline void prvSetupTimerInterrupt( void ) __attribute__((always_inline));
static inline void prvSetupTimerInterrupt(void) {
    uint16_t ucOC;
    uint8_t ucPrescaler;

    vFindBestTimerValues(&ucOC, &ucPrescaler);
    OCR0A = (uint8_t) ucOC;
    TCCR0A = 2; // use just CTC mode
    TCCR0B = 5 - ucPrescaler;
    TIMSK0 = 2;
}
#endif /* (PORT_AVR_TIMER == 0) */

#if (PORT_AVR_TIMER == 1)
static inline void prvSetupTimerInterrupt( void ) __attribute__((always_inline));
static inline void prvSetupTimerInterrupt(void) {
    uint16_t usOC;
    uint8_t ucPrescaler;

    vFindBestTimerValues(&usOC, &ucPrescaler);
    TCCR1B = (1 << WGM12) | (5 - ucPrescaler); // use just CTC mode
    OCR1A = usOC;
    TIMSK1 = 2; // Enable COMPA interrupt
}
#endif /* (PORT_AVR_TIMER == 1) */

#if (PORT_AVR_TIMER == 2)
static inline void prvSetupTimerInterrupt( void ) __attribute__((always_inline));
static inline void prvSetupTimerInterrupt(void) {
    uint16_t ucOC;
    uint8_t ucPrescaler;

    vFindBestTimerValues(&ucOC, &ucPrescaler);
    TCCR2A = 2; // use just CTC mode
    TCCR2B = 7 - ucPrescaler;
    OCR2A = (uint8_t) ucOC;
    TIMSK2 = 2;
}
#endif /* (PORT_AVR_TIMER == 2) */

#endif /* AVR4_TIMER_H */
