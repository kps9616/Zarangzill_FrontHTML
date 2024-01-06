package com.example.zaranzill_fronthtml.view;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewController {

    private static final Logger logger = LoggerFactory.getLogger(ViewController.class);
    @GetMapping("shotform")
    public ModelAndView main(Model model) {
        ModelAndView mav = new ModelAndView();

        logger.info("hello");
        mav.setViewName("main");
        mav.addObject("title","메인입니다.");
        return mav;
    }

}
