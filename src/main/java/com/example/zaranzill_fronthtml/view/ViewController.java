package com.example.zaranzill_fronthtml.view;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;

@Controller
public class ViewController {

    private static final Logger logger = LoggerFactory.getLogger(ViewController.class);
    //팬 페이지
    @GetMapping("fans")
    public ModelAndView main(Model model) {
        ModelAndView mav = new ModelAndView();

        logger.info("hello");
        mav.setViewName("fans");
        mav.addObject("title","메인입니다.");
        return mav;
    }
    //월 우승 진행 중 페이지
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
    //주 우승 진행중 페이지
    @GetMapping("weekWinner")
    public ModelAndView weekWinner(Model model) {
        ModelAndView mav = new ModelAndView();
        LocalDate now = LocalDate.now();

        logger.info("hello");
        mav.setViewName("weekWinner");
        mav.addObject("year",now.getYear());
        mav.addObject("month",now.getMonthValue());
        return mav;
    }
    //예전 월 우승 목록 페이지
    @GetMapping("monthWinnerList")
    public ModelAndView monthWinnerList(@RequestParam String dType, @RequestParam int sYear, @RequestParam int sMonth, Model model) {
        ModelAndView mav = new ModelAndView();
        LocalDate sDay = LocalDate.of(sYear, sMonth, 1);
        LocalDate now = LocalDate.now();

        if("before".equals(dType)) {
            sDay = sDay.minusMonths(1);
        }
        else {
            sDay = sDay.plusMonths(1);
        }

        if(now.getYear() == sDay.getYear() && now.getMonthValue() == sDay.getMonthValue()) {
            mav.setViewName("monthWinner");
            mav.addObject("year",now.getYear());
            mav.addObject("month",now.getMonthValue());
        }
        else {
            mav.setViewName("monthWinnerList");
            mav.addObject("sYear",sDay.getYear());
            mav.addObject("sMonth",sDay.getMonthValue());
        }

        return mav;
    }

    //예전 주 우승 목록 페이지
    @GetMapping("weekWinnerList")
    public ModelAndView weekWinnerList(@RequestParam String dType, @RequestParam int sYear, @RequestParam String isEnd, Model model) {
        ModelAndView mav = new ModelAndView();
        LocalDate sDay = LocalDate.of(sYear, 1, 1);
        LocalDate now = LocalDate.now();

        if("before".equals(dType) && "D".equals(isEnd)) {
            sDay = now;
        }
        else if("before".equals(dType) &&! "D".equals(isEnd)) {
            sDay = sDay.minusYears(1);
        }
        else if("after".equals(dType) && !"Y".equals(isEnd)) {
            sDay = sDay.plusYears(1);
        }

        if(now.getYear() == sDay.getYear() && "Y".equals(isEnd)) {
            mav.setViewName("weekWinner");
            mav.addObject("year",now.getYear());
            mav.addObject("month",now.getMonthValue());
        }
        else {
            mav.setViewName("weekWinnerList");
            mav.addObject("sYear",sDay.getYear());
        }

        return mav;
    }

}
