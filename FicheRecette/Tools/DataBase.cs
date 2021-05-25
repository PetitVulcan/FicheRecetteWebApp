using FicheRecette.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace FicheRecette.Tools
{
    public class DataBase
    {
        private static DataBase _instance = null;
        private static object _lock = new object();

        private DataBase()
        {

        }
        public static DataBase Instance
        {
            get
            {
                lock (_lock)
                {
                    if (_instance == null)
                    {
                        _instance = new DataBase();
                    }
                    return _instance;
                }
            }
        }


        public void AjouterRecette(Recette r)
        {
            MySqlCommand command = new MySqlCommand("INSERT INTO recette (date,nomutilisateur,nomrecette,nbpersonne,difficulte,realisation,nomcategory) OUTPUT INSERTED.id values(@Date,@NomUtilisateur,@NomRecette,@NbPersonne,@Difficulte,@Realisation,@NomCategory)", Connection.Instance);
            command.Parameters.Add(new MySqlParameter("@date", SqlDbType.DateTime) { Value = DateTime.Now });
            command.Parameters.Add(new MySqlParameter("@NomUtilisateur", SqlDbType.VarChar) { Value = r.NomUtilisateur });
            command.Parameters.Add(new MySqlParameter("@NomRecette", SqlDbType.VarChar) { Value = r.NomRecette });
            command.Parameters.Add(new MySqlParameter("@NbPersonne", SqlDbType.Int) { Value = r.NbPersonne });
            command.Parameters.Add(new MySqlParameter("@Difficulte", SqlDbType.VarChar) { Value = r.Difficulte });
            command.Parameters.Add(new MySqlParameter("@Realisation", SqlDbType.NText) { Value = r.Realisation });
            command.Parameters.Add(new MySqlParameter("@NomCategory", SqlDbType.VarChar) { Value = r.NomCategory });
            Connection.Instance.Open();
            r.Id = (int)command.ExecuteScalar();
            command.Dispose();
            foreach (Ingredient ing in r.Ingredients)
            {
                command = new MySqlCommand("INSERT INTO ingredient (Idrecette, nom, quantite, unite) values(@IdRecette,@Nom,@Quantite,@Unite)", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@Nom", ing.Nom));
                command.Parameters.Add(new MySqlParameter("@Idrecette", r.Id));
                command.Parameters.Add(new MySqlParameter("@Quantite", ing.Quantite));
                command.Parameters.Add(new MySqlParameter("@Unite", ing.Unite));
                command.ExecuteNonQuery();
                command.Dispose();
            }
            foreach (ImageRecette img in r.Images)
            {
                command = new MySqlCommand("INSERT INTO images (urlimage,Idrecette) values(@Url,@Idrecette)", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@Url", img.Url));
                command.Parameters.Add(new MySqlParameter("@Idrecette", r.Id));
                command.ExecuteNonQuery();
                command.Dispose();
            }

            command = new MySqlCommand("UPDATE utilisateur SET nbRecettecree = nbRecettecree+1 WHERE nomutilisateur = @nomUtilisateur", Connection.Instance);
            command.Parameters.Add(new MySqlParameter("@nomUtilisateur", SqlDbType.VarChar) { Value = r.NomUtilisateur });
            command.ExecuteNonQuery();
            command.Dispose();

            Connection.Instance.Close();
            return;
        }

        public void ModifierRecette(Recette r)
        {
            MySqlCommand command = new MySqlCommand("Update INTO recette (date,nomutilisateur,nomrecette,nbpersonne,difficulte,realisation,nomcategory) OUTPUT INSERTED.id values(@Date,@NomUtilisateur,@NomRecette,@NbPersonne,@Difficulte,@Realisation,@NomCategory) WHERE Id = @Id", Connection.Instance);
            command.Parameters.Add(new MySqlParameter("@Idate", SqlDbType.Int) { Value = r.Id });
            command.Parameters.Add(new MySqlParameter("@NomUtilisateur", SqlDbType.VarChar) { Value = r.NomUtilisateur });
            command.Parameters.Add(new MySqlParameter("@NomRecette", SqlDbType.VarChar) { Value = r.NomRecette });
            command.Parameters.Add(new MySqlParameter("@NbPersonne", SqlDbType.Int) { Value = r.NbPersonne });
            command.Parameters.Add(new MySqlParameter("@Difficulte", SqlDbType.VarChar) { Value = r.Difficulte });
            command.Parameters.Add(new MySqlParameter("@Realisation", SqlDbType.NText) { Value = r.Realisation });
            command.Parameters.Add(new MySqlParameter("@NomCategory", SqlDbType.VarChar) { Value = r.NomCategory });
            Connection.Instance.Open();
            r.Id = (int)command.ExecuteScalar();
            command.Dispose();
            foreach (Ingredient ing in r.Ingredients)
            {
                command = new MySqlCommand("INSERT INTO ingredient (Idrecette, nom, quantite, unite) values(@IdRecette,@Nom,@Quantite,@Unite)", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@Nom", ing.Nom));
                command.Parameters.Add(new MySqlParameter("@Idrecette", r.Id));
                command.Parameters.Add(new MySqlParameter("@Quantite", ing.Quantite));
                command.Parameters.Add(new MySqlParameter("@Unite", ing.Unite));
                command.ExecuteNonQuery();
                command.Dispose();
            }
            foreach (ImageRecette img in r.Images)
            {
                command = new MySqlCommand("Update INTO images (urlimage) values(@Url,@Idrecette) WHERE Idrecette = @Id", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@Url", img.Url));
                command.Parameters.Add(new MySqlParameter("@Id", r.Id));
                command.ExecuteNonQuery();
                command.Dispose();
            }
            Connection.Instance.Close();
            return;
        }


        public void SupprimerRecette(Recette r)
        {
            MySqlCommand command = new MySqlCommand("DELETE  FROM recette WHERE Id=@Id", Connection.Instance);
            command.Parameters.Add(new MySqlParameter("@Id", r.Id));
            Connection.Instance.Open();
            command.ExecuteScalar();
            command.Dispose();
            MySqlCommand command1 = new MySqlCommand("DELETE  FROM images WHERE Idrecette=@Id", Connection.Instance);
            //command.Parameters.Add(new MySqlParameter("@Id", r.Id));
            command.ExecuteNonQuery();
            command.Dispose();
            Connection.Instance.Close();
            return;
        }

        public List<Recette> AvoirListeRecette(int? IdCategory)
        {
            List<Recette> listeRecette = new List<Recette>();
            MySqlCommand command;
            if (IdCategory == null)
            {
                command = new MySqlCommand("SELECT * From recette ", Connection.Instance);
                Connection.Instance.Open();
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Recette r = new Recette {NomCategory = reader.GetString(7), Id = reader.GetInt32(0), NomRecette = reader.GetString(3), NbPersonne = reader.GetInt32(4), Difficulte = reader.GetString(5), NomUtilisateur = reader.GetString(2), Date = reader.GetDateTime(1), };
                    listeRecette.Add(r);

                }
                reader.Close();
                command.Dispose();
            }
            else
            {
                command = new MySqlCommand("SELECT Id, nomrecette, nbpersonne, difficulte, nomutilisateur, date From recette WHERE IdCategory = @IdCategory", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@IdCategory", SqlDbType.Int) { Value = IdCategory });
                Connection.Instance.Open();
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {

                    Recette r = new Recette { Id = reader.GetInt32(0), NomRecette = reader.GetString(3), NbPersonne = reader.GetInt32(4), Difficulte = reader.GetString(5), NomUtilisateur = reader.GetString(2), Date = reader.GetDateTime(1) };
                    r.IdCategory = (int)IdCategory;
                    listeRecette.Add(r);

                }
                reader.Close();
                command.Dispose();

            }

            for (int i = 0; i < listeRecette.Count; i++)
            {

                command = new MySqlCommand("SELECT Id, Urlimage from images WHERE Idrecette = @idrecette", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@idrecette", listeRecette[i].Id));
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    listeRecette[i].Images.Add(new ImageRecette { Id = reader.GetInt32(0), Url = reader.GetString(1) });
                }
                reader.Close();
                command.Dispose();

            }
            Connection.Instance.Close();
            return listeRecette;
        }

        public List<Recette> AvoirListeRecetteTri(string NomCategory)
        {
            List<Recette> listeRecette = new List<Recette>();
            MySqlCommand command;
            if (NomCategory == null)
            {
                command = new MySqlCommand("SELECT * From Recette ", Connection.Instance);
                Connection.Instance.Open();
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Recette r = new Recette { NomCategory = reader.GetString(8), Id = reader.GetInt32(0), NomRecette = reader.GetString(3), NbPersonne = reader.GetInt32(4), Difficulte = reader.GetString(5), NomUtilisateur = reader.GetString(2), Date = reader.GetDateTime(1), };
                    listeRecette.Add(r);

                }
                reader.Close();
                command.Dispose();
            }
            else
            {
                command = new MySqlCommand("SELECT Id, nomrecette, nbpersonne, difficulte, nomutilisateur, date From recette WHERE nomcategory = @NomCategory", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@NomCategory", SqlDbType.VarChar) { Value = NomCategory });
                Connection.Instance.Open();
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {

                    Recette r = new Recette { Id = reader.GetInt32(0), NomRecette = reader.GetString(1), NbPersonne = reader.GetInt32(2), Difficulte = reader.GetString(3), NomUtilisateur = reader.GetString(4), Date = reader.GetDateTime(5)};
                    r.NomCategory = @NomCategory;
                    listeRecette.Add(r);

                }
                reader.Close();
                command.Dispose();

            }

            for (int i = 0; i < listeRecette.Count; i++)
            {

                command = new MySqlCommand("SELECT Id, Urlimage from images WHERE Idrecette = @IdRecette", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@IdRecette", listeRecette[i].Id));
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    listeRecette[i].Images.Add(new ImageRecette { Id = reader.GetInt32(0), Url = reader.GetString(1) });
                }
                reader.Close();
                command.Dispose();

            }
            Connection.Instance.Close();
            return listeRecette;
        }

        public List<Recette> AfficherRecette(int Id)
        {

            List<Recette> InfoRecette = new List<Recette>();
            MySqlCommand command = new MySqlCommand("SELECT * FROM recette WHERE Id=@Id", Connection.Instance);
            command.Parameters.Add(new MySqlParameter("@Id", SqlDbType.Int) { Value = Id });
            Connection.Instance.Open();
            MySqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                Recette r = new Recette { NomCategory = reader.GetString(7), Id = reader.GetInt32(0), NomRecette = reader.GetString(3), NbPersonne = reader.GetInt32(4), Difficulte = reader.GetString(5), NomUtilisateur = reader.GetString(2), Date = reader.GetDateTime(1), Realisation = reader.GetString(6) };
                InfoRecette.Add(r);
            }
            reader.Close();
            command.Dispose();
            for (int i = 0; i < InfoRecette.Count; i++)
            {
                command = new MySqlCommand("SELECT nom, quantite, unite from ingredient WHERE Idrecette = @Id", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@Id", InfoRecette[i].Id));
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    InfoRecette[i].Ingredients.Add(new Ingredient { Nom = reader.GetString(0), Quantite = reader.GetInt32(1), Unite= reader.GetString(2)});
                }
                reader.Close();
                command.Dispose();

            }
            for (int i = 0; i < InfoRecette.Count; i++)
            {
                command = new MySqlCommand("SELECT Id, Urlimage from images WHERE Idrecette = @Id", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@Id", InfoRecette[i].Id));
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    InfoRecette[i].Images.Add(new ImageRecette { Id = reader.GetInt32(0), Url = reader.GetString(1) });
                }
                reader.Close();
                command.Dispose();

            }

            Connection.Instance.Close();
            return InfoRecette;
        }
        
        public List<Category> LoadCategories()
        {
            List<Category> liste = new List<Category>();
            MySqlCommand command = new MySqlCommand("SELECT * FROM Category", Connection.Instance);
            Connection.Instance.Open();
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Category c = new Category { Id = reader.GetInt32(0), Titre = reader.GetString(1) };
                liste.Add(c);
            }
            reader.Close();
            command.Dispose();
            Connection.Instance.Close();
            return liste;
        }
        public void AddCategory(Category c)
        {
            MySqlCommand command = new MySqlCommand("INSERT INTO Category(Titre) OUTPUT INSERTED.ID VALUES(@Titre)", Connection.Instance);
            command.Parameters.Add(new MySqlParameter("@Titre", c.Titre));
            Connection.Instance.Open();
            c.Id = (int)command.ExecuteScalar();
            command.Dispose();
            Connection.Instance.Close();
        }

        public void DeleteCategory(Category c)
        {
            MySqlCommand command = new MySqlCommand("DELETE FROM Category WHERE Id = @id", Connection.Instance);
            command.Parameters.Add(new MySqlParameter("@id", c.Id));
            Connection.Instance.Open();
            command.ExecuteNonQuery();
            Connection.Instance.Close();
        }

        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }

        public void AjouterUtilisateur(Utilisateur u)
        {
            if (u.Admin == null)
            {
                u.Admin = "false";
            }
            MySqlCommand command = new MySqlCommand("INSERT INTO utilisateur (nom,prenom,nomutilisateur,email,nbrecettecree,mdp,admin) VALUES (@nom,@prenom,@NomUtilisateur,@eMail,@NbRecettecree,@Mdp,@Admin)", Connection.Instance);
            MD5 md5Hash = MD5.Create();
            string MdpHash = GetMd5Hash(md5Hash, u.Mdp);            
            command.Parameters.Add(new MySqlParameter("@Nom", SqlDbType.VarChar) { Value = u.Nom });
            command.Parameters.Add(new MySqlParameter("@Prenom", SqlDbType.VarChar) { Value = u.Prenom });
            command.Parameters.Add(new MySqlParameter("@NomUtilisateur", SqlDbType.VarChar) { Value = u.NomUtilisateur });
            command.Parameters.Add(new MySqlParameter("@eMail", SqlDbType.VarChar) { Value = u.EMail });
            command.Parameters.Add(new MySqlParameter("@NbRecettecree", SqlDbType.Int) { Value= u.NbRecettecree });
            command.Parameters.Add(new MySqlParameter("@Mdp", SqlDbType.VarChar) { Value = MdpHash });
            command.Parameters.Add(new MySqlParameter("@Admin", SqlDbType.VarChar) { Value = u.Admin });
            Connection.Instance.Open();
            int nbLignes = command.ExecuteNonQuery();
            command.Dispose();
            Connection.Instance.Close();
            return;
        }

        public void SupprimerUtilisateur(Utilisateur u)
        {
            MySqlCommand command = new MySqlCommand("DELETE FROM utilisateur WHERE Id=@Id", Connection.Instance);
            command.Parameters.Add(new MySqlParameter("@id", u.Id));
            Connection.Instance.Open();
            command.ExecuteNonQuery();
            command.Dispose();
            Connection.Instance.Close();
            return;
        }

        public List<Utilisateur> AvoirListeUtilisateur()
        {
            List<Utilisateur> listeUtilisateur = new List<Utilisateur>();
            MySqlCommand command = new MySqlCommand("SELECT * FROM utilisateur", Connection.Instance);
            Connection.Instance.Open();
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Utilisateur u = new Utilisateur { Id = reader.GetInt32(0), Nom = reader.GetString(2), Prenom = reader.GetString(3), NomUtilisateur = reader.GetString(4), EMail = reader.GetString(5), NbRecettecree = reader.GetInt32(6) , Admin = reader.GetString(8)};
                listeUtilisateur.Add(u);
            }
            reader.Close();
            command.Dispose();
            Connection.Instance.Close();
            return listeUtilisateur;
        }
       public bool UserAdmin(Utilisateur u)
        {
            bool retour = false;
            if (u.NomUtilisateur != null)
            {
                MySqlCommand command = new MySqlCommand("SELECT admin FROM utilisateur where nomutilisateur=@NomUtilisateur", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@NomUtilisateur", u.NomUtilisateur));
                Connection.Instance.Open();
                MySqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    u.Admin = reader.GetString(0);                    
                }
                else
                {
                    retour = false;
                }
                reader.Close();
                command.Dispose();
                Connection.Instance.Close();
                if(u.Admin == "true")
                {
                    retour = true;
                }
                else
                {
                    retour = false;
                }
            }
            else
            {
                retour = false;
            }
            return retour;
        }
        public bool LookUser(Utilisateur u)
        {
            bool retour = false;
            if (u.NomUtilisateur != null)
            {
                MySqlCommand command = new MySqlCommand("SELECT * FROM utilisateur where NomUtilisateur=@NomUtilisateur", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@NomUtilisateur", u.NomUtilisateur));
                Connection.Instance.Open();
                MySqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    u.Id = reader.GetInt32(0);
                    retour = true;
                }
                else
                {
                    retour = false;
                }
                reader.Close();
                command.Dispose();
                
            }
            else
            {
                retour = false;
            }
            Connection.Instance.Close();
            return retour;
        }

        public bool LookUser(string NomUtilisateur, string Mdp, Utilisateur u)
        {
            bool retour = false;
            if (NomUtilisateur != null)
            {
                MD5 md5Hash = MD5.Create();
                string MdpHash = GetMd5Hash(md5Hash, Mdp);
                MySqlCommand command = new MySqlCommand("SELECT Id, nom, prenom FROM utilisateur where NomUtilisateur=@NomUtilisateur and Mdp = @Mdp", Connection.Instance);
                command.Parameters.Add(new MySqlParameter("@NomUtilisateur", NomUtilisateur));
                command.Parameters.Add(new MySqlParameter("@Mdp", MdpHash));
                Connection.Instance.Open();
                MySqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    u.Id = reader.GetInt32(0);
                    u.Nom = reader.GetString(1);
                    u.Prenom = reader.GetString(2);
                    retour = true;
                }
                else
                {
                    retour = false;
                }
                reader.Close();
                command.Dispose();
                Connection.Instance.Close();
            }
            else
            {
                retour = false;
            }
            return retour;
        }
    }
}