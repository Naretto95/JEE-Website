package main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;



@ComponentScan(basePackages= {"controller","main"})
@EntityScan(basePackages = {"model"})
@SpringBootApplication
public class SpringLauncher extends SpringBootServletInitializer{

	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SpringLauncher.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(SpringLauncher.class, args);
	}
	
}
