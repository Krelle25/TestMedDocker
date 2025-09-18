package com.example.testmeddocker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class HelloRestController {
    @GetMapping("/")
    public String hello() {
        return "Hello Docker!";
    }

    @GetMapping("/healthz")
    public Map<String, String> health() {
        return Map.of("status", "UP", "service", "TestMedDocker");
    }
}
