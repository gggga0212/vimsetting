        drvGPIO_SetScenario(GPIO_4, GPIO_04_SCN_DEBUGMON4); // set GPIO 4 to Debug bus scenario
        drvGPIO_SetScenario(GPIO_5, GPIO_05_SCN_DEBUGMON5); // set GPIO 5 to Debug bus scenario
        drvGPIO_SetScenario(GPIO_6, GPIO_06_SCN_DEBUGMON6); // set GPIO 4 to Debug bus scenario
        drvGPIO_SetScenario(GPIO_17, GPIO_17_SCN_DEBUGMON7); // set GPIO 5 to Debug bus scenario
        *(volatile uint32_t *)0x400037E0 = 0x00000700UL; //F701 Debug bus sel   5:other 
        *(volatile uint32_t *)0x4000FF10 = 0x0000002DUL; //set debug_hwsel 32 to check txRawdata mdmTxdata
        *(volatile uint32_t *)0x400037e8= (20 << 0) + (21 << 8) + (22 << 16) + (23 << 24);
