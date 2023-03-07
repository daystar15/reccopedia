package com.reccopedia;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.reccopedia.user.bo.UserBO;
import com.reccopedia.user.model.User;

@SpringBootTest
class ReccopediaApplicationTests {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	UserBO userBO;
	
	@Test
	void contextLoads() {
		logger.info("################ logger test");
	}

	
	@Transactional
	@Test
	void userTest() {
		userBO.insertUser("test", "test", "test");
	}

}
