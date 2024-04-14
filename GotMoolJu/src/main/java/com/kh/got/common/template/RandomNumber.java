package com.kh.got.common.template;

import java.util.Random;

public class RandomNumber {
	
	/** 휴대폰 인증용 랜덤 넘버 리턴하는 메소드
	 *  @return randonNumber : 4자리 랜덤 넘버
	 */
	public static int random4() {
        Random rand = new Random();
        
        int randomNumber = rand.nextInt(9000) + 1000;

        return randomNumber;
    }
	
	/** 이메일 인증용 랜덤 넘버 리턴하는 메소드
	 *  @return randonNumber : 6자리 랜덤 넘버
	 */
	public static int random6() {
        Random rand = new Random();
        
        int randomNumber = rand.nextInt(900000) + 100000;

        return randomNumber;
    }

}
