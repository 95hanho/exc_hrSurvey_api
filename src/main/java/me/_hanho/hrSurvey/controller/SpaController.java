package me._hanho.hrSurvey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SpaController {

	// SPA용, 모두 index.html로 리다이렉트
	@GetMapping(value = {"/survey/**", "/admin/**"})
    public String redirect() {
        return "forward:/index.html";
    }
}
