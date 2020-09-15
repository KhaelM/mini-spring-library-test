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
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.ParserConfigurationException;
import model.Acteur;
import model.Film;
import model.Realisateur;
import org.xml.sax.SAXException;

/**
 *
 * @author miker
 */
@Controller(path = "/films")
public class FilmController {

    @Path(name = "/{database}", httpVerbs = {HttpVerb.GET})
    @Folder(path = "films")
    public String afficherTousLesFilms(Model model, @PathVariable(name = "database") String db) throws ParserConfigurationException, IOException, SAXException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException, SQLException {
        GenericDao genericDao = null;
        if (db.equals("mysql")) {
            genericDao = new GenericDao("1");
        } else if (db.equals("psql")) {
            genericDao = new GenericDao("2");
        } else if (db.equals("oracle")) {
            genericDao = new GenericDao("3");
        }

        if (genericDao != null) {
            CriteriaBuilder cb = genericDao.getCriteriaBuilder(Film.class);
            if (model.getRequestParameter("page") != null) {
                cb.setPagination(Integer.parseInt(model.getRequestParameter("page")), 10);
            }
            List<Film> films = (List<Film>) genericDao.select();
            model.addAttribute("films", films);
            model.addAttribute("titre", "Films");
        }
        return "index";
    }

    @Path(name = "/{id}/{database}", httpVerbs = {HttpVerb.GET, HttpVerb.POST})
    @Folder(path = "films")
    public String afficherFilmParId(Film film, Model model, @PathVariable(name = "id") int id, @PathVariable(name = "database") String db) throws ParserConfigurationException, IOException, SAXException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException, SQLException {
        // Chargement de la Base de donnée avec l'id=1 GenericDao genericDao = new GenericDao("1");
        GenericDao genericDao = null;
        if (db.equals("mysql")) {
            genericDao = new GenericDao("1");
        } else if (db.equals("psql")) {
            genericDao = new GenericDao("2");
        } else if (db.equals("oracle")) {
            genericDao = new GenericDao("3");
        }
        
        if(genericDao != null) {
            genericDao.getCriteriaBuilder(Film.class);
        }
        
        if (model.getRequestParameter("supprimer") != null && genericDao != null) {
            genericDao.delete(film);
            model.addAttribute("message", film.getNom() + " a été supprimé");
            afficherTousLesFilms(model, db);
            return "index";
        }

        if (model.getRequestParameter("update") != null && genericDao != null) {
            if (model.getRequestParameter("realisateur.nom") != null && !model.getRequestParameter("realisateur.nom").isEmpty()) {
                Realisateur r = new Realisateur();
                r.setId(Integer.parseInt(model.getRequestParameter("realisateur.id")));
                r.setNom(model.getRequestParameter("realisateur.nom"));
                film.setRealisateur(r);
            }
            genericDao.update(film);
            model.addAttribute("message", "Mis à jour");
        }

        if (genericDao != null) {
            film = (Film) genericDao.selectById(id);
            model.addAttribute("film", film);
            model.addAttribute("titre", "Film " + id);
        }
        return "filmId";
    }

    @Path(name = "/formulaire/{database}", httpVerbs = {HttpVerb.GET, HttpVerb.POST})
    @Folder(path = "films")
    public String afficherFormulaire(Film film, Model model, @PathVariable(name = "database") String db) throws ParserConfigurationException, IOException, SAXException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException, SQLException {
        GenericDao genericDao = null;
        if (db.equals("mysql")) {
            genericDao = new GenericDao("1");
        } else if (db.equals("psql")) {
            genericDao = new GenericDao("2");
        } else if (db.equals("oracle")) {
            genericDao = new GenericDao("3");
        }

        if (model.getRequestParameter("idRealisateur") != null && !model.getRequestParameter("idRealisateur").isEmpty()) {
            Realisateur r = new Realisateur();
            r.setId(Integer.parseInt(model.getRequestParameter("idRealisateur")));
            film.setRealisateur(r);
        }

        String ids = model.getRequestParameter("idActeurs");
        if (ids != null) {
            for (String idActeur : ids.split(";")) {
                System.out.println(":: '" + idActeur + "'");
            }
        }

        if (ids != null) {
            List<Acteur> acteurs = new ArrayList<Acteur>();
            for (String idActeur : ids.split(";")) {
                Acteur a = new Acteur();
                a.setId(Integer.parseInt(idActeur));
                acteurs.add(a);
            }
            film.setActeurs(acteurs);
        }

        if (genericDao != null) {
            genericDao.insert(film);
        }

        model.addAttribute("titre", "Formulaire Film");
        return "formulaire";
    }
}
