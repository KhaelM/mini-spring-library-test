/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import annotation.Controller;
import annotation.Folder;
import annotation.Path;
import core.Model;
import model.Person;
import core.Json;

/**
 *
 * @author miker
 */
@Controller(path="/JspController")
public class JspController {
    @Path(name="/home")
    public String displayHomePage(Person person, Model model) {
        model.addAttribute("personne", person);
        model.addToSession("Foo", "bar");
        return "home";
    }
    
    @Path(name="")
    public String index() {
        return "index";
    }
    
    @Path(name="/json")
    public Json getJson(Person person) {
        Json json = new Json();
        json.setData(person);
        json.setStatusCode(200);
        return json;
    }
      
    @Path(name="/backoffice")
    @Folder(path="backoffice")
    public String displayBackoffice() {
        return "page";
    }
}
