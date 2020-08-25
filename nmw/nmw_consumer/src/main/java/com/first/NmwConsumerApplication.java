package com.first;

import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDubbo
public class NmwConsumerApplication {

    public static void main(String[] args) {
        SpringApplication.run(NmwConsumerApplication.class, args);
    }

}
