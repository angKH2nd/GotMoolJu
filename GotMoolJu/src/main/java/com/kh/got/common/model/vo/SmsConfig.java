package com.kh.got.common.model.vo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.Getter;

@Component
@PropertySource("classpath:application.properties")
@Getter
public class SmsConfig {
	@Value("${sms.api.key}")
    private String smsApiKey;

    @Value("${sms.api.secret}")
    private String smsApiSecret;
}
