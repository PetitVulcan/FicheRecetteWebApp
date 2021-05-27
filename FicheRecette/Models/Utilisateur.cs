using FicheRecette.Tools;
using System;
using System.Collections.Generic;

namespace FicheRecette.Models
{
    public class Utilisateur
    {
        private DateTime date;
        private string nom;
        private string prenom;
        private string nomUtilisateur;
        private string eMail;
        private int id;
        private int nbRecettecree;
        private string mdp;
        private string admin;


        public string NomUtilisateur { get => nomUtilisateur; set => nomUtilisateur = value; }
        public string EMail { get => eMail; set => eMail = value; }
        public int Id { get => id; set => id = value; }
        public int NbRecettecree { get => nbRecettecree; set => nbRecettecree = value; }
        public string Mdp { get => mdp; set => mdp = value; }
        public string Nom { get => nom; set => nom = value; }
        public string Prenom { get => prenom; set => prenom = value; }
        public string Admin { get => admin; set => admin = value; }
        public DateTime Date { get => date; set => date = value; }

        public Utilisateur()
        {
            Date = DateTime.Now;
            NbRecettecree = 0;
        }
        public Utilisateur(string NomUtilisateur) : this()
        {
            this.NomUtilisateur = NomUtilisateur;
        }
        public Utilisateur(string Nom,string Prenom, string NomUtilisateur, string EMail, string Mdp, string Admin) : this()
        {            
            this.Nom = Nom;
            this.Prenom = Prenom;
            this.NomUtilisateur = NomUtilisateur;
            this.EMail = EMail;
            this.Mdp = Mdp;
            this.Admin = Admin;
            
        }
        public override string ToString()
        {
            return "NomUtilisateur : " + NomUtilisateur + " - Adresse email : " + EMail + " - Nombre de recette(s) crée(s) : " + NbRecettecree + " - Administrateur : " + Admin;
        }

        public void AjouterUtilisateur()
        {
            DataBase.Instance.AjouterUtilisateur(this);
        }

        public void SupprimerUtilisateur()
        {
            DataBase.Instance.SupprimerUtilisateur(this);
        }

        public static List<Utilisateur> AvoirListeUtilisateur()
        {
            return DataBase.Instance.AvoirListeUtilisateur();
        }
        public bool Exist()
        {
            return DataBase.Instance.LookUser(this);
        }
        public bool UserAdmin()
        {
            return DataBase.Instance.UserAdmin(this);
        }
        public bool ExistWithPassword()
        {
            return DataBase.Instance.LookUser(NomUtilisateur,Mdp, this);
        }
    }
}
