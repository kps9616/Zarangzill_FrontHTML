package com.example.zaranzill_fronthtml.view;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;

@Controller
public class ViewController {

    private static final Logger logger = LoggerFactory.getLogger(ViewController.class);
    @GetMapping("fans")
    public ModelAndView main(Model model) {
        ModelAndView mav = new ModelAndView();

        logger.info("hello");
        mav.setViewName("fans");
        mav.addObject("title","메인입니다.");
        return mav;
    }
    @GetMapping("monthWinner")
    public ModelAndView monthWinner(Model model) {
        ModelAndView mav = new ModelAndView();
        LocalDate now = LocalDate.now();


        logger.info("hello");
        mav.setViewName("monthWinner");
        mav.addObject("year",now.getYear());
        mav.addObject("month",now.getMonthValue());
        return mav;
    }

}
