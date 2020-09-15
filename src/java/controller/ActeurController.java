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
import com.michael.framework.LogicalOperator;
import com.michael.framework.Restrictions;
import core.HttpVerb;
import core.Model;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.xml.parsers.ParserConfigurationException;
import model.Acteur;
import org.xml.sax.SAXException;

/**
 *
 * @author miker
 */
@Controller(path="/acteurs")
public class ActeurController {
    @Path(name="/{database}", httpVerbs = {HttpVerb.GET})
    @Folder(path="acteurs")
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
            CriteriaBuilder cb = genericDao.getCriteriaBuilder(Acteur.class);
            if(model.getRequestParameter("page") != null && !model.getRequestParameter("page").isEmpty()) {
                System.out.println(model.getRequestParameter("page"));
                cb.setPagination(Integer.parseInt(model.getRequestParameter("page")), 5);
            } else {
                System.out.println("pas de pagination");
            }
            List<Acteur> acteurs = (List<Acteur>) genericDao.select();
            model.addAttribute("acteurs", acteurs); 
            model.addAttribute("titre", "Acteurs");
            
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
    
    
    @Path(name="/recherche/{database}", httpVerbs = {HttpVerb.GET, HttpVerb.POST})
    @Folder(path="acteurs")
    public String rechercherActeurs(Model model, @PathVariable(name="database") String db) throws ParserConfigurationException, IOException, SAXException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException, SQLException, ParseException {
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
            CriteriaBuilder cb = genericDao.getCriteriaBuilder(Acteur.class);
            String nom = model.getRequestParameter("nom");
            String dateDebut = model.getRequestParameter("dateDebut");
            String dateFin = model.getRequestParameter("dateFin");
            String pattern = "yyyy-MM-dd";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            
            if(nom != null && !nom.isEmpty()) {
                if(dateDebut != null && !dateFin.isEmpty()) {
                    cb.add(Restrictions.eq("Acteur", "nom", nom), LogicalOperator.AND);
                    cb.add(Restrictions.between("Acteur", "date_naissance", simpleDateFormat.parse(dateDebut), simpleDateFormat.parse(dateFin)), LogicalOperator.NONE);
                } else {
                    cb.add(Restrictions.eq("Acteur", "nom", nom), LogicalOperator.NONE);
                }
            } else {
               if(dateDebut != null && !dateFin.isEmpty()) {
                    cb.add(Restrictions.between("Acteur", "date_naissance", simpleDateFormat.parse(dateDebut), simpleDateFormat.parse(dateFin)), LogicalOperator.NONE);
                } 
            }
            
            
            List<Acteur> acteurs = (List<Acteur>) genericDao.select();
            model.addAttribute("acteurs", acteurs);
            model.addAttribute("titre", "Recherche");
        }
        return "recherche";
    }
    
    @Path(name="/{id}/{database}", httpVerbs = {HttpVerb.GET})
    @Folder(path="acteurs")
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
            genericDao.getCriteriaBuilder(Acteur.class);
            Acteur acteur = (Acteur) genericDao.selectById(id);
            model.addAttribute("acteur", acteur);
            model.addAttribute("titre", "Acteur " + id);
        }
        return "acteurId";
    }
}
