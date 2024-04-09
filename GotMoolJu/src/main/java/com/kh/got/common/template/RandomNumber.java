package com.kh.got.common.template;

import java.util.Random;

public class RandomNumber {
	
	public static int random4() {
        Random rand = new Random();
        
        int randomNumber = rand.nextInt(9999) + 1;

        return randomNumber;
    }

}
