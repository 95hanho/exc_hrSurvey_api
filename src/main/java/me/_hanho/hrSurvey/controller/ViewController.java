package me._hanho.hrSurvey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	@GetMapping({"/", "/{path:[^\\.]*}"}) // 정적 파일이 아닌 모든 경로를 index.html로
    public String forward() {
        return "forward:/index.html";
	}
}
