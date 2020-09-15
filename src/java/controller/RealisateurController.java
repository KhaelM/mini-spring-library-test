/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import annotation.Controller;
import annotation.Folder;
import annotation.Path;
import annotation.PathVariable;
import com.michael.framework.CriteriaBuilder;
import com.michael.framework.GenericDao;
import core.HttpVerb;
import core.Model;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import javax.xml.parsers.ParserConfigurationException;
import model.Acteur;
import model.Realisateur;
import org.xml.sax.SAXException;

/**
 *
 * @author miker
 */
@Controller(path="/realisateurs")
public class RealisateurController {
    @Path(name="/{database}", httpVerbs = {HttpVerb.GET})
    @Folder(path="realisateurs")
    public String afficherTousLesActeurs(Model model, @PathVariable(name="database") String db) throws ParserConfigurationException, IOException, SAXException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException, SQLException {
        // Chargement de la Base de donnée avec l'id=1 GenericDao genericDao = new GenericDao("1");
        GenericDao genericDao = null;
        if(db.equals("mysql")) {
            genericDao = new GenericDao("1");
        } else if(db.equals("psql")) {
            genericDao = new GenericDao("2");
        } else if(db.equals("oracle")) {
            genericDao = new GenericDao("3");
        }
        
        if(genericDao != null) {
            CriteriaBuilder cb = genericDao.getCriteriaBuilder(Realisateur.class);
            if(model.getRequestParameter("page") != null && !model.getRequestParameter("page").isEmpty()) {
                System.out.println(model.getRequestParameter("page"));
                cb.setPagination(Integer.parseInt(model.getRequestParameter("page")), 5);
            } else {
                System.out.println("pas de pagination");
            }
            List<Realisateur> realisateurs = (List<Realisateur>) genericDao.select();
            model.addAttribute("realisateurs", realisateurs); 
            model.addAttribute("titre", "Realisateurs");
            
            if(model.getSessionAttribute("indice") == null) {
                model.addToSession("indice", 0);
            } else {
                int indice = (int) model.getSessionAttribute("indice");    
                model.addToSession("indice", ++indice);
                if(indice % 3 == 0) {
                    model.addToSession("parite", "pair");
                } else {
                    model.removeFromSession("parite");
                }
            }
        }
        return "index";
    }
    
    @Path(name="/{id}/{database}", httpVerbs = {HttpVerb.GET})
    @Folder(path="realisateurs")
    public String afficherActeurParId(Model model, @PathVariable(name="id") int id,  @PathVariable(name="database") String db) throws ParserConfigurationException, IOException, SAXException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException, SQLException {
        // Chargement de la Base de donnée avec l'id=1 GenericDao genericDao = new GenericDao("1");
        GenericDao genericDao = null;
        if(db.equals("mysql")) {
            genericDao = new GenericDao("1");
        } else if(db.equals("psql")) {
            genericDao = new GenericDao("2");
        } else if(db.equals("oracle")) {
            genericDao = new GenericDao("3");
        }
        
        if(genericDao != null) {   
            genericDao.getCriteriaBuilder(Realisateur.class);
            Realisateur realisateur = (Realisateur) genericDao.selectById(id);
            model.addAttribute("realisateur", realisateur);
            model.addAttribute("titre", "Realisateur" + id);
        }
        return "realisateurId";
    }
}
