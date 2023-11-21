package oop21.BasiDiDati;

import java.util.Scanner;

public class App 
{
    public static void main( String[] args )
    {
    	String url_DB="jdbc:mysql://localhost:3306/databasemacchinariestetici";
    	String root ="root";
        String psw ="Arancione01!";
        Query query = new Query();
        int scelta = 0;
        Scanner in=new Scanner(System.in);
        
        do 
        {
        	System.out.println("Quale operazione si desidera effettuare?	(Inserire -1 per uscire)");
        	System.out.println();
        	System.out.println("1- Registrazione di un cliente;");
        	System.out.println("2- Acquisto di un macchinario;");
        	System.out.println("3- Consegna di un macchinario ad un corriere;");
        	System.out.println("4- Acquisto di un macchinario di tipo accessorio;");
        	System.out.println("5- Avvio di un intervento di manutenzione di un macchinario;");
        	System.out.println("6- Verifica della possibilità di assegnare un operario ad un intervento di manutenzione;");
        	System.out.println("7- Coinvolgimento di un dipendente in un intervento;");
        	System.out.println("8- Visualizzazione per ogni dipendente del numero di macchinari che ha riparato;");
        	System.out.println("9- Visualizzazione dei codici dei macchinari affidati ad un corriere o per i quali è in atto un intervento di manutenzione con stato in lavorazione;");
        	System.out.println("10- Visualizzazione dei macchinari per i quali non è stato mai richiesto un intervento di manutenzione;");
        	System.out.println("11- Stampa dei dati degli ingegneri, compreso il numero di richieste di sostituzione che ha definito;");
        	System.out.println("12- Stampa dei dati degli ingegneri che non hanno mai progettato macchinari di tipo accessorio;");
        	System.out.println("13- Stampa di un report che mostri i dati delle categorie di tipo accessorio, inclusa la quantità totale di macchinari di tipo base a cui sono stati associati;");
        	System.out.println("14- Stampa di un report che mostri i dati degli operari compreso il numero totale di ore dedicate agli interventi di manutenzione;");
        	System.out.println("15- Stampa di un report che mostri i dati dei clienti, incluso il numero totale di prodotti acquistati;");
        	scelta=in.nextInt();
        	query.Connessione(url_DB, root, psw);
        	
        	switch(scelta)
        	{
        		case 1:
        		{
        			System.out.println("Inserire il codice fiscale del cliente");
					String cf = in.next();
				
					System.out.println("Inserire il nome del cliente");
					String nome = in.next();
				
					System.out.println("Inserire il cognome del cliente");
					String cognome = in.next();
				
					System.out.println("Inserire il numero di telefono del cliente");
					String numTelefono = in.next();

					System.out.println("Inserire la data di nascita del cliente");
					String data = in.next();
					
					System.out.println("Inserire l'email del cliente");
					String email = in.next();
					
					query.InserimentoCliente(cf, nome, cognome, numTelefono, data, email);
        			break;
        		}
        		
        		case 2:
        		{
        			query.AcquistoMacchinario(in);
        			break;
        		}
        		
        		case 3:
        		{
        			query.ConsegnaMacchinarioCorriere(in);
        			break;
        		}
        		
        		case 4:
        		{
        			query.AcquistoMacchinarioTipoAccessorio(in);
        			break;
        		}
        		
        		case 5:
        		{
        			query.AvvioInterventoManutenzioneMacchinario(in);
        			break;
        		}
        		
        		case 6:
        		{
        			String operaio=query.VerificaPossibilitaDiAssegnareOperaioIntervento(in);
        			System.out.println("Operaio verificato: "+ operaio);
        			break;
        		}
        		
        		case 7:
        		{
        			query.CoinvolgimentoDipendente(in);
        			break;
        		}
        		
        		case 8:
        		{
        			query.StampaDipendentiCheHannoRiparatoUnMacchinario();
        			break;
        		}
        		
        		case 9:
        		{
        			query.StampaDeiMacchinariAffidatiAiCorrieriORInLavorazione();
        			break;
        		}
        		
        		case 10:
        		{
        			query.StampaMacchinariMaiRichiestoIntervento();
        			break;
        		}
        		
        		case 11:
        		{
        			query.StampaIlNumeroSostituzioniDelIngegnere();
        			break;
        		}
        		
        		case 12:
        		{
        			query.StampaIngegneriCheNonHannoMaiProgettatoAccessorio();
        			break;
        		}
        		
        		case 13:
        		{
        			query.StampaMacchinariAccessori();
        			break;
        		}
        		
        		case 14:
        		{
        			query.StampaDatiOperaio();
        			break;
        		}
        		
        		case 15:
        		{
        			query.StampaDatiClienti();
        			break;
        		}
        	}
        }
        while(scelta!=-1);
        
        in.close();
    }
}
