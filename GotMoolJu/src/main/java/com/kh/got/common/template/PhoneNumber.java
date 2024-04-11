package com.kh.got.common.template;

public class PhoneNumber {
	
	public static String phoneNumberFormat(String phoneNumber) {
		String digitsOnly = phoneNumber.replaceAll("[^0-9]", "");
	    if (digitsOnly.length() >= 10) {
	        return String.format("010-%s-%s", digitsOnly.substring(3, 7), digitsOnly.substring(7));
	    } else {
	        return phoneNumber;
	    }
	}

}
