package com.dbproject;

import com.dbproject.repositories.UsersRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class CardealershipApplication {

	private static final Logger log = LoggerFactory.getLogger(CardealershipApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(CardealershipApplication.class, args);
	}

}
