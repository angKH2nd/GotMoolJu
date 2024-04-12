package com.kh.got.common.template;

import java.util.Random;

public class RandomNumber {
	
	/** 랜덤 넘버 리턴하는 메소드
	 *  @return randonNumber : 4자리 랜덤 넘버
	 */
	public static int random4() {
        Random rand = new Random();
        
        int randomNumber = rand.nextInt(9000) + 1000;

        return randomNumber;
    }

}
