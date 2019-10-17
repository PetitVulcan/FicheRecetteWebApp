using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FicheRecette.Models
{
    public class Ingredient
    {
        private int id;
        private int idRecette;
        private string nom;
        private int quantite;
        private string unite;

        public int Id { get => id; set => id = value; }
        public string Nom { get => nom; set => nom = value; }
        public int Quantite { get => quantite; set => quantite = value; }
        public string Unite { get => unite; set => unite = value; }
        public int IdRecette { get => idRecette; set => idRecette = value; }

        public override string ToString()
        {
            return Nom + ": " + Quantite + " " + Unite;
        }
    }
}
