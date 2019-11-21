package com.shop.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entities.User;
import com.shop.model.UserDTO;
import com.shop.repository.UserRepository;

@Controller
@RequestMapping("")
public class UserController extends CommonController {
  
  private final static int LOGIN_FAILED = -1;
  private final static int ENTITY_EXSITED = -9;
  
  private @Autowired UserRepository userRepository;

  @GetMapping("/user/logout")
  public @ResponseBody void logout(HttpServletRequest request) {
    request.getSession().setAttribute("user", null);
  }
  
  @PostMapping("/user/login")
  public @ResponseBody Object submitLogin(@RequestBody UserDTO model, HttpServletRequest request) {
    Optional<User> opt = userRepository.findByUsernameAndPassword(model.getUsername(), model.getPassword());
    if (opt.isPresent()) {
      request.getSession().setAttribute("user", opt.get());
      return opt.get().getRole();
    }
    return LOGIN_FAILED;
  }
  
  @GetMapping("/user/{id}")
  public @ResponseBody User getUser(@PathVariable long id) {
    return userRepository.findById(id).get();
  }
  
  @PostMapping("/user/registry")
  public @ResponseBody Object registry(@RequestBody UserDTO dto) {
    
    if (userRepository.findByUsername(dto.getUsername()).isPresent()) {
      return ENTITY_EXSITED;
    }
    
    User user = new User();
    user.setAddress(dto.getAddress());
    user.setEmail(dto.getEmail());
    user.setName(dto.getName());
    user.setPassword(dto.getPassword());
    user.setPhone(dto.getPhone());
    user.setRole(1);
    user.setUsername(dto.getUsername());
    return userRepository.save(user).getId();
  }
  
  @PutMapping("/user/update")
  public @ResponseBody Object update(@RequestBody UserDTO dto, HttpServletRequest request) {
    User user = new User();
    user.setId(dto.getId());
    user.setAddress(dto.getAddress());
    user.setEmail(dto.getEmail());
    user.setName(dto.getName());
    user.setPassword(dto.getPassword());
    user.setPhone(dto.getPhone());
    user.setUsername(dto.getUsername());
    user.setRole(1);
    
    int resp = userRepository.save(user).getId();
    request.getSession().setAttribute("user", user);
    return resp;
  }
}
