package oop21.BasiDiDati;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Query 
{
	private Connection conn;
	
	public void Connessione(String url,String root,String psw) 
	{
			try 
			{
				this.conn = DriverManager.getConnection(url, root, psw);
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
	}
	
	public  void InserimentoCliente(String cf,String nome,String cognome,String numTelefono, String data, String email) 
	{
		Statement s;
		try 
		{
			s = conn.createStatement();
			String query = "INSERT INTO cliente VALUES('"+cf+"','"+nome+"','"+cognome+"','"+ data +"',0,'"+numTelefono+"','"+email+"');";
			System.out.println(query);
			s.executeUpdate(query);
			s.close();
			conn.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	}
	
	public void AcquistoMacchinario(Scanner sc) 
	{
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s3 = conn.createStatement();
			
			String queryClienti = "SELECT * from cliente";
			String queryMacchinari = "SELECT `codice seriale` FROM macchinario, progetto WHERE progetto.macchinario = `codice seriale` AND progetto.tipo = 'Commercializzato' AND  macchinario.cliente IS NULL;";
			
			
			s1.execute(queryClienti);
			ResultSet rClienti = s1.getResultSet();
			int scelta;
			int contatore = 0;
			
			while(rClienti.next())
			{
				contatore++;
				System.out.println("Cliente "+ contatore + " :" + rClienti.getString(1));
			}
			
			System.out.println("Scegliere il cliente che effettua l'acquisto:");
			scelta = sc.nextInt();
			
			if(scelta > contatore || scelta < 1)	throw new Exception("Cliente scelto non in lista");
			
			rClienti.beforeFirst();
			contatore = 0;
			
			while(scelta != contatore && rClienti.next())
			{
				contatore++;
			}
			
			s2.execute(queryMacchinari);
			ResultSet rMacchinari = s2.getResultSet();
			contatore = 0;
			
			while(rMacchinari.next())
			{
				contatore++;
				System.out.println("Macchinario "+ contatore + " :" + rMacchinari.getString(1));
			}
			
			System.out.println("Scegliere il macchinario da acquistare:");
			scelta = sc.nextInt();
			
			if(scelta > contatore || scelta < 1)	throw new Exception("Macchinario scelto non in lista");
			
			rMacchinari.beforeFirst();
			contatore = 0;
			
			while(scelta != contatore && rMacchinari.next())
			{
				contatore++;
			}
			
			int numeroAcquisti = rClienti.getInt("#_acquisti") + 1;
			String updateCliente = "UPDATE `cliente` SET `#_acquisti` = " + numeroAcquisti + " WHERE (`CF` = '" + rClienti.getString(1) + "');";
			System.out.println(updateCliente);
			String updateMacchinari = "UPDATE `macchinario` SET `cliente` = `"+ rClienti.getString(1) + "` WHERE (`Codice seriale` = '" + rMacchinari.getString(1) +"');";
			System.out.println(updateMacchinari);
			
			s3.executeUpdate(updateCliente);
			s3.executeUpdate(updateMacchinari);
			
			rMacchinari.close();
			rClienti.close();
			s2.close();
			s1.close();
			s3.close();
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}	
	}
	
	public void ConsegnaMacchinarioCorriere(Scanner sc) 
	{
		
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s3 = conn.createStatement();
			
			String queryMacchinari = "SELECT `codice seriale` FROM macchinario WHERE cliente IS NOT NULL AND corriere IS NULL;";
			String queryCorriere = "SELECT * FROM corriere";
			
			s1.execute(queryMacchinari);
			ResultSet rMacchinari = s1.getResultSet();
			int scelta;
			int contatore = 0;
			while(rMacchinari.next())
			{
				contatore++;
				System.out.println("Macchinario "+ contatore + " :" + rMacchinari.getString(1));
			}
			System.out.println("Scegliere il macchinario da consegnare");
			
			scelta = sc.nextInt();
			if(scelta > contatore || scelta < 1)	throw new Exception("Macchinario scelto non in lista");
			
			rMacchinari.beforeFirst();
			
			contatore = 0;
			while(scelta != contatore && rMacchinari.next())
			{
				
				contatore++;
			}
			
			s2.execute(queryCorriere);
			ResultSet rCorriere = s2.getResultSet();
			contatore = 0;
			while(rCorriere.next())
			{
				contatore++;
				System.out.println("Corriere "+ contatore + " :" + rCorriere.getString(1));
			}
			System.out.println("Scegliere il corriere per effettuare la consegna:");
			
			scelta = sc.nextInt();
			if(scelta > contatore || scelta < 1)	throw new Exception("Corriere scelto non in lista");
			
			rCorriere.beforeFirst();
			contatore = 0;
			while(scelta != contatore && rCorriere.next())
			{
				contatore++;
			}
			
			String updateMacchinario = "UPDATE `macchinario` SET `corriere` = '" + rCorriere.getString(1) + "' WHERE (`codice seriale` = '" + rMacchinari.getString(1) + "');";
			s3.execute(updateMacchinario);
			
			rMacchinari.close();
			rCorriere.close();
			s2.close();
			s1.close();
			s3.close();
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void AcquistoMacchinarioTipoAccessorio(Scanner sc) 
	{
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s3 = conn.createStatement();
			
			String queryAccessori = "SELECT `codice seriale` FROM macchinario, progetto WHERE progetto.macchinario = `codice seriale`AND progetto.tipo = 'Commercializzato' AND  macchinario.cliente IS NULL AND macchinario.accessoria IS NOT NULL;";
			String queryClienti = "SELECT * FROM cliente";
			
			s1.execute(queryAccessori);
			ResultSet rMacchinari = s1.getResultSet();
			int scelta;
			int contatore = 0;
			while(rMacchinari.next())
			{
				contatore++;
				System.out.println("Macchinario "+ contatore + " :" + rMacchinari.getString(1));
			}
			System.out.println("Scegliere il macchinario accessorio");
			
			scelta = sc.nextInt();
			if(scelta > contatore || scelta < 1)	throw new Exception("Macchinario scelto non in lista");
			
			rMacchinari.beforeFirst();
			
			contatore = 0;
			while(scelta != contatore && rMacchinari.next())
			{
				
				contatore++;
			}
			
			s2.execute(queryClienti);
			ResultSet rClienti = s2.getResultSet();
			contatore = 0;
			while(rClienti.next())
			{
				contatore++;
				System.out.println("Cliente "+ contatore + " :" + rClienti.getString(1));
			}
			System.out.println("Scegliere il cliente che acquista il macchinaro:");
			
			scelta = sc.nextInt();
			if(scelta > contatore || scelta < 1)	throw new Exception("Cliente scleto non in lista");
			
			rClienti.beforeFirst();
			
			contatore = 0;
			while(scelta != contatore && rClienti.next())
			{
				System.out.println("Cliente "+ contatore + " :" + rClienti.getString(1));
				contatore++;
			}
			
			int numeroAcquisti = rClienti.getInt("#_acquisti") + 1;
			
			String updateCliente = "UPDATE `cliente` SET `#_acquisti` = " + numeroAcquisti + " WHERE (`CF` = '" + rClienti.getString(1) + "');";
			System.out.println(updateCliente);
			String updateMacchinari = "UPDATE `macchinario` SET `cliente` = '"+ rClienti.getString(1) + "' WHERE (`Codice seriale` = '" + rMacchinari.getString(1) +"');";
			System.out.println(updateMacchinari);
			s3.executeUpdate(updateCliente);
			s3.executeUpdate(updateMacchinari);
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public void AvvioInterventoManutenzioneMacchinario(Scanner sc)
	{
		try 
		{
            Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            Statement s2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            Statement s3 = conn.createStatement();
            
            String queryMacchinari = "SELECT * \r\n"
                    + "FROM macchinario "
                    + "WHERE corriere IS NULL AND cliente IS NOT NULL";
            
            int contatore = 0;
            int scelta;
            
            //Scelta macchinario
            
            s1.execute(queryMacchinari);
            ResultSet rMacchinari = s1.getResultSet();
            
            while(rMacchinari.next())
            {
                contatore++;
                System.out.println("Macchinario "+ contatore + " \t:" + rMacchinari.getString(1));
            }
            
            System.out.println("Scegliere il macchinario su cui avviare l'intervento di manutenzione");
            scelta = sc.nextInt();
            
            if(scelta > contatore || scelta < 1)
            {
                rMacchinari.close(); s1.close(); s2.close(); s3.close();
                throw new Exception("Macchinario scelto non in lista");
            }
                
            rMacchinari.beforeFirst();
            contatore = 0;
            
            while(scelta != contatore && rMacchinari.next())
            {
                contatore++;
            }            
            
            String queryManutenzione = "Select max(`# progressivo`) from `intervento di manutenzione`";
            s3.execute(queryManutenzione);
            ResultSet rManutenzione = s3.getResultSet();
            rManutenzione.next();
            int numero_progressivo = rManutenzione.getInt(1) + 1;
            
            Date date = new Date();  
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String strDate= formatter.format(date);  
            
            String intervento = "insert into `intervento di manutenzione` values("+ numero_progressivo +",'"+ rMacchinari.getString(1)+"',"+ "NULL , '" +strDate+ "', 'Richiesto');";
            
            s3.execute(intervento);
            
        } 
		catch (SQLException e) 
		{
            e.printStackTrace();
        } 
		catch (Exception e) 
		{
            e.printStackTrace();
        }
		
	}
	
	public String VerificaPossibilitaDiAssegnareOperaioIntervento(Scanner sc)
	{
		
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			String queryOperai = "SELECT cf, COUNT(cf) AS coinvolgimenti FROM operaio JOIN `coinvolgimento operaio` ON  Operaio = operaio.CF GROUP BY(cf);";
			
			int contatore = 0;
			int scelta;
			
			//Scelta operaio da verificare
			do {
				s1.execute(queryOperai);
				ResultSet rOperai = s1.getResultSet();
				while(rOperai.next())
				{
					contatore++;
					System.out.println("Operaio "+ contatore + " :" + rOperai.getString(1));
				}
				System.out.println("Scegliere l'operaio da verificare");
			
				scelta = sc.nextInt();
				if(scelta > contatore || scelta < 1)	throw new Exception("Operaio scelto non in lista");
				
				rOperai.beforeFirst();
				
				contatore = 0;
				while(scelta != contatore && rOperai.next())
				{
					contatore++;
				}
				
				contatore = 0;
				if(rOperai.getInt("coinvolgimenti") == 3)
				{
					System.out.println("Operaio con 3 coinvolgimenti: vuoi scegliere un altro operaio da verificare? 1 = si / 0 = no");
					int buff = sc.nextInt();
					if(buff == 0)
						return null;	
					else 
						continue;
				}
				
				else return rOperai.getString("cf");
			}while(true);
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public void CoinvolgimentoDipendente(Scanner sc) 
	{
		 try 
		 {
	            Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	            Statement s2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	            Statement s3 = conn.createStatement();
	            
	            String queryIntervento = "SELECT * FROM `intervento di manutenzione` where `Stato dell'intervento` <> 'Completato';";
	            
	            int contatore = 0;
	            int scelta;
	            
	            //Scelta intervento di manutenzione
	            
	            s1.execute(queryIntervento);
	            ResultSet rInterventi = s1.getResultSet();
	            
	            while(rInterventi.next())
	            {
	                contatore++;
	                System.out.println("Intervento di manutenzione "+ contatore + " :\t" + rInterventi.getString(1));
	            }
	            
	            System.out.println("Scegliere l'intervento di manutenzione");
	            scelta = sc.nextInt();
	            
	            if(scelta > contatore || scelta < 1)
	            {
	                rInterventi.close();
	                s1.close();
	                s2.close();
	                throw new Exception("Intervento scelto non in lista");
	            }
	            
	            rInterventi.beforeFirst();
				
				contatore = 0;
				while(scelta != contatore && rInterventi.next())
				{
					contatore++;
				}
				
				System.out.println("Vuoi coinvolgere un operaio o un ingegnere? 1 = operaio, 0 = ingegnere");
	            scelta = sc.nextInt();
	            
	            if(scelta == 1)
	            {
	                String cfOperaio = VerificaPossibilitaDiAssegnareOperaioIntervento(sc);
	                
	                Date date = new Date();  
	                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	                String strDate= formatter.format(date);
	                
	                String aggiuntaOperaio = "INSERT INTO `coinvolgimento operaio` VALUES('"+ rInterventi.getString(1) +"', '" + cfOperaio +"', 0, '" + strDate + "', NULL);";  
	                System.out.println(aggiuntaOperaio);
	                
	                s3.execute(aggiuntaOperaio);
	                
	                
	            }
	            else
	            {
	                String queryIngegnere = "SELECT * FROM progettobasedidati.ingegnere";
	                s2.execute(queryIngegnere);
	                ResultSet rIngegnere = s2.getResultSet();
	                contatore = 0;
	                while(rIngegnere.next())
	                {
	                    contatore++;
	                    System.out.println("Ingegnere "+ contatore + " :\t" + rIngegnere.getString(1));
	                }
	                
	                System.out.println("Scegliere L'ingegnere da assegnare all'intervento");
	                scelta = sc.nextInt();
	            
	                
	                if(scelta > contatore || scelta < 1)
	                {
	                    rInterventi.close();
	                    s1.close();
	                    s2.close();
	                    throw new Exception("Ingegnere scelto non in lista");
	                }
	                
	                rIngegnere.beforeFirst();
	                contatore = 0;
	                
	                while(scelta != contatore && rIngegnere.next())
	                {
	                    contatore++;
	                }
	                
	                Date date = new Date();  
	                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	                String strDate= formatter.format(date);
	                
	                String aggiuntaIngegnere = "INSERT INTO `coinvolgimento ingegnere` VALUES('"+ rIngegnere.getString(1) +"', " + rInterventi.getString(1) +", 0, '" + strDate + "', NULL);";  
	                System.out.println(aggiuntaIngegnere);
	                
	                s3.execute(aggiuntaIngegnere);
	            }
	            
	            rInterventi.close();
	            s1.close();
	            s2.close();
	            
	        } 
		 	catch (SQLException e) 
		 	{
	            e.printStackTrace();
	        }
		 	catch (Exception e) 
		 	{
	            e.printStackTrace();
	        }
	}
	
	public void StampaDipendentiCheHannoRiparatoUnMacchinario()
	{
		
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String queryDipendente ="SELECT cf as dipendente, count(`Data Fine`)\r\n"
					+ "from (operaio left join `coinvolgimento operaio` on operaio.cf = `coinvolgimento operaio`.Operaio)\r\n"
					+ "group by(cf)\r\n"
					+ "Union\r\n"
					+ "SELECT cf as dipendente, count(`Data Fine`)\r\n"
					+ "from (ingegnere left join `coinvolgimento ingegnere` on ingegnere.cf = `coinvolgimento ingegnere`.ingegnere)\r\n"
					+ "group by(cf);";
			
			
			s1.execute(queryDipendente);
			ResultSet rDipendente = s1.getResultSet();
			int contatore = 0;
			
			while(rDipendente.next())
			{
				contatore++;
				System.out.println("Dipendente "+ contatore + " :" + rDipendente.getString(1) + "\t Numero interventi completati: " + rDipendente.getString(2));
			}
			System.out.println();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	public void StampaDeiMacchinariAffidatiAiCorrieriORInLavorazione()
	{
		
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			String queryMacchinari = "SELECT `codice seriale`, `cliente`, `Base`, `accessoria`, `Descrizione`, `Prezzo`, `# lotto`\r\n"
					+ "FROM macchinario\r\n"
					+ "LEFT JOIN `intervento di manutenzione` on macchinario.`Codice seriale` = `intervento di manutenzione`.Macchinario\r\n"
					+ "WHERE `intervento di manutenzione`.`Stato dell'intervento` = 'In Lavorazione' or corriere IS NOT NULL;";
			
			s1.execute(queryMacchinari);
			
			ResultSet rMacchinari = s1.getResultSet();
			int contatore = 0;
			
			while(rMacchinari.next())
			{
				contatore++;
				System.out.println("Macchinario " + contatore + " :" +rMacchinari.getString(1));
			}
			System.out.println("");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void StampaMacchinariMaiRichiestoIntervento() 
	{
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s2 = conn.createStatement();
			
			String queryMacchinari = "SELECT *\r\n"
					+ "FROM macchinario LEFT JOIN `intervento di manutenzione` ON macchinario.`Codice seriale` = `intervento di manutenzione`.Macchinario\r\n"
					+ "WHERE `# progressivo` IS NULL;";
			
			s1.execute(queryMacchinari);
			
			ResultSet rMacchinari = s1.getResultSet();
			int contatore = 0;
			
			while(rMacchinari.next())
			{
				contatore++;
				System.out.println("Macchinario " + contatore + " :" +rMacchinari.getString(1));
			}
			System.out.println("");
			
			rMacchinari.close();
			s1.close();
			s2.close();
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	public void StampaIlNumeroSostituzioniDelIngegnere() 
	{
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s2 = conn.createStatement();
			
			String queryIngegneri = "SELECT cf, COUNT(Tipo) AS  numInterventiDiSostituzione\r\n"
					+ "FROM ingegnere left join `intervento di sostituzione` on ingegnere.cf = `intervento di sostituzione`.ingegnere\r\n"
					+ "GROUP BY(cf);";
			
			s1.execute(queryIngegneri);
			
			ResultSet rIngegneri = s1.getResultSet();
			int contatore = 0;
			
			while(rIngegneri.next())
			{
				contatore++;
				System.out.println("Ingegnere " + contatore + " :" +rIngegneri.getString(1) + " NumInterventiDiSostituzione: " + rIngegneri.getString(2));
			}
			System.out.println("");
			
			rIngegneri.close();
			s1.close();
			s2.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	public void StampaIngegneriCheNonHannoMaiProgettatoAccessorio() 
	{
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s2 = conn.createStatement();
			
			String queryIngegneri = "SELECT *, COUNT(Accessoria) AS numProgetto\r\n"
					+ "FROM ingegnere LEFT JOIN (macchinario JOIN progetto ON `codice seriale` = macchinario) ON ingegnere.cf = ingegnere\r\n"
					+ "GROUP BY(cf)\r\n"
					+ "HAVING numProgetto = 0;";
			
			s1.execute(queryIngegneri);
			
			ResultSet rIngegneri = s1.getResultSet();
			int contatore = 0;
			
			while(rIngegneri.next())
			{
				contatore++;
				System.out.println("Ingegnere " + contatore + " :" +rIngegneri.getString(1));
			}
			System.out.println("");
			
			rIngegneri.close();
			s1.close();
			s2.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public void StampaMacchinariAccessori() 
	{
		try 
		{
			Statement s1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			Statement s2 = conn.createStatement();
			
			String queryAccessori = "select accessoria.*, count(`macchinario base`)\r\n"
					+ "from accessoria left join (macchinario left join associazione on macchinario.`Codice seriale` = associazione.`Macchinario accessorio`) on accessoria.Nome = macchinario.Accessoria\r\n"
					+ "group by(nome)";
			
			s1.execute(queryAccessori);
			
			ResultSet rAccessori = s1.getResultSet();
			int contatore = 0;
			
			while(rAccessori.next())
			{
				contatore++;
				System.out.println("Categoria " + contatore + " :" +rAccessori.getString(1) + " destinazione d'uso : " + rAccessori.getString(2) + " Applicabile a più macchinari: " + rAccessori.getString(3)
				+ " Applicazione totali: " + rAccessori.getString(4));
			}
			System.out.println("");
			
			rAccessori.close();
			s1.close();
			s2.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	public void StampaDatiOperaio() 
	{
		try 
		{
			Statement s = conn.createStatement();
			String queryOperaio = "SELECT * FROM operaio";
			s.execute(queryOperaio);
			
			ResultSet rOperaio = s.getResultSet();
			int contatore = 0;
			
			while(rOperaio.next()) 
			{
				contatore++;
				System.out.println("Operaio " + contatore + " :" +rOperaio.getString(1) + " Nome: " + rOperaio.getString(2) + " Cognome: " + rOperaio.getString(3)
				+ " Data di nascita: " + rOperaio.getString(4) + " Email: " + rOperaio.getString(5) + " Numero di telefono: " + rOperaio.getString(6)+ "ORE MANUTENZIONE: "+rOperaio.getString(7)+" Tipo contratto: "+rOperaio.getString(8));
			}
			
			s.close();
			rOperaio.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	public void StampaDatiClienti() 
	{
		try 
		{
			Statement s = conn.createStatement();
			String queryCliente = "SELECT * FROM cliente";
			s.execute(queryCliente);
			
			ResultSet rCliente = s.getResultSet();
			int contatore = 0;
			
			while(rCliente.next()) 
			{
				contatore++;
				System.out.println("Cliente " + contatore + " :" +rCliente.getString(1) + " Nome: " + rCliente.getString(2) + " Cognome: " + rCliente.getString(3)
				+ " Data di nascita: " + rCliente.getString(4) +" NUMERO ACQUISTI: "+ rCliente.getString(5)+ " Email: " + rCliente.getString(6) + " Numero di telefono: " + rCliente.getString(7));
			}
			
			s.close();
			rCliente.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
