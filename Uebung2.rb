class Konto
	def initialize
		@kontostand = 0
		@kontoinhaber = " "
		@kontonummer = 0
		@ueberziehungsrahmen = 50
	end

	def einzahlen(betrag)
		@kontostand += betrag
		puts "Es wurden #{betrag} EUR erfolgreich eingezahlt!"
		puts "Der neue Kontostand beträgt #{kontostand} EUR"
	end

	def abheben(betrag)
		if kontostand+ueberziehungsrahmen==0
			puts "Abheben ist nicht möglich, da der Kontostand #{kontostand} EUR beträgt und der Überziehungsrahmen von #{ueberziehungsrahmen} EUR auch schon ausgereizt ist!" 
		elsif kontostand+ueberziehungsrahmen<betrag
			puts "Abheben ist nicht möglich!" 
			puts "Es kann nur ein Betrag von #{kontostand+ueberziehungsrahmen} EUR ausgezahlt werden."
		else
			@kontostand = kontostand-betrag
			puts "Es wurden #{betrag} EUR erfolgreich ausgezahlt!"
			puts "Der neue Kontostand beträgt #{kontostand} EUR"
		end
	end

	def ueberweisen(betrag,konto)
		if kontostand+ueberziehungsrahmen<betrag
			puts "Eine Überweisung ist nicht möglich, da ihr Kontostand nur #{kontostand} EUR beträgt und Sie #{betrag} EUR überweisen wollen!"
		else
			@kontostand = kontostand-betrag
			konto.kontostand += betrag
			puts "Die Überweisung an #{konto.kontoinhaber} über #{betrag} EUR war erfolgreich!"
			puts "Ihr neuer Kontostand beträgt #{@kontostand} EUR."
		end

	end

	attr_accessor :kontostand, :kontoinhaber , :kontonummer, :ueberziehungsrahmen
end

#Programmstart
puts "Willkommen zum Bankomat 2000!"
puts "------------------------------"
a=true
while a do
	puts "Was wollen Sie tun?"
	puts "1. Erzeugen zweier Konten"
	puts "2. Abfrage des Kontostands"
	puts "3. Setzen des Kontoinhaber und Kontonummer"
	puts "4. Abfrage der Kontoinhaber und Kontonummer"
	puts "5. Einzahlen auf beide Konten"
	puts "6. Abhaben bei beide Konten"
	puts "7. Abfragen des Kontostandes bei beiden Konten"
	puts "8. Mehr Abheben als möglich ist. Testen ob sich der Kontostand verändert hat."
	puts "9. Überweisen von einem Konto auf das andere Konto"
	puts "10. Mehr Überweisen als möglich ist. Testen ob sich der Kontostand verändert hat"
	puts "11. Ändern des Überziehungsrahmens"
	puts "12. Wiederholen von 6.-11. mit Überziehungsrahmen"
	puts "13. Ende"
	puts " "
	puts "Bitte zuerst Punkt 1 wählen!"
	auswahl = gets.chomp
	case auswahl
	when "1"
		konto1 = Konto.new
		konto1.kontoinhaber = "Hans Müller"
		konto1.kontonummer = 1234543234
		konto2 = Konto.new
		konto2.kontoinhaber = "Kalle"
		konto2.kontonummer = 5676543454323
		puts "Konten angelegt!"
		puts " "
	when "2"
		puts "Abfrage Kontostand"
		puts "Den Kontostand für welches Konto soll angezeigt werden? (1 oder 2)"
		b=gets.chomp
		if b=="1"
			puts "Kontostand für Konto 1: #{konto1.kontostand} EUR"
		elsif b=="2"
			puts "Kontostand für Konto 2: #{konto2.kontostand} EUR"
		else
			puts "Fehler!"
		end
		puts " "
	when "3"
		puts "Kontoinhaber und Kontonummer setzen"
		puts "Kontoinhaber Konto 1"
		ki1 = gets.chomp
		konto1.kontoinhaber = ki1
		puts "Kontonummer Konto 1"
		kn1 = gets.chomp
		konto1.kontonummer = kn1
		puts "Kontoinhaber Konto 2"
		ki2 = gets.chomp
		konto2.kontoinhaber = ki2
		puts "Kontonummer Konto 2"
		kn2 = gets.chomp
		konto2.kontonummer = kn2
		puts " "
	when "4"
		puts "Kontoinhaber und Kontonummer abfragen"
		puts "Kontoinhaber Konto 1: #{konto1.kontoinhaber}"
		puts "Kontonummer Konto 1: #{konto1.kontonummer}"
		puts "Kontoinhaber Konto 2: #{konto2.kontoinhaber}"
		puts "Kontonummer Konto 2: #{konto2.kontonummer}"
		puts " "
	when "5"
		puts "Überweisung"
		puts "Wieviel wollen Sie auf das Konto 1 einzahlen?"
		e1 = gets.chomp
		konto1.einzahlen(e1.to_i)
		puts "Wieviel wollen Sie auf das Konto 2 einzahlen?"
		e2 = gets.chomp
		konto2.einzahlen(e2.to_i)
		puts " "
	when "6"
		"Geld abheben"
		puts "Wieviel wollen Sie vom Konto 1 abheben?"
		a1 = gets.chomp
		konto1.abheben(a1.to_i)
		puts "Wieviel wollen Sie vom Konto 2 abheben?"
		a2 = gets.chomp
		konto2.abheben(a2.to_i)
		puts " "
	when "7"
		puts "Kontostände abfragen"
		puts "Der Kontostand für Konto 1 beträgt #{konto1.kontostand} EUR."
		puts "Der Kontostand für Konto 2 beträgt #{konto2.kontostand} EUR."
		puts " "
	when "8"
		"Auszahlung testen"
		puts "Es werden vom Konto1 #{konto1.kontostand+konto1.ueberziehungsrahmen+10} EUR angefordert:"
		konto1.abheben(konto1.kontostand+konto1.ueberziehungsrahmen+10)
		puts "Es werden vom Konto2 #{konto2.kontostand+konto2.ueberziehungsrahmen+10} EUR angefordert:"
		konto2.abheben(konto2.kontostand+konto2.ueberziehungsrahmen+10)
		puts " "
	when "9"
		"Überweisung tätigen"
		puts "Welches ist das sendende Konto? 1 oder 2"
		se1 = gets.chomp
		puts "Welches ist das empfangende Konto? 1 oder 2"
		em1 = gets.chomp
		puts "Wieviel wollen Sie überweisen?"
		be1 = gets.chomp.to_i
		if se1 == "1"&&em1=="2"
			konto1.ueberweisen(be1,konto2)
		elsif se1 == "2"&&em1=="1"
			konto2.ueberweisen(be1,konto2)
		elsif se1=="1"&&em1=="1"||se1=="2"&&em1=="2"
			puts "Überweisungen auf das gleiche Konto sind nicht möglich!"
		else
			puts "Fehler!"
		end
		puts " "
	when "10"
		"Überweisungen testen"
		puts "Es werden vom Konto1 #{konto1.kontostand+konto1.ueberziehungsrahmen+10} EUR an Konto 2 überwiesen:"
		konto1.ueberweisen(konto1.kontostand+konto1.ueberziehungsrahmen+10,konto2)
		puts "Es werden vom Konto2 #{konto2.kontostand+konto2.ueberziehungsrahmen+10} EUR an Konto 1 überwiesen:"
		konto2.ueberweisen(konto2.kontostand+konto2.ueberziehungsrahmen+10,konto1)
		puts " "
	when "11"
		"Überziehungsrahmen neu festlegen"
		puts "Höhe des neuen Überziehungsrahmens für Konto1:"
		ue1 = gets.chomp.to_i
		konto1.ueberziehungsrahmen = ue1
		puts "Der Überziehungsrahmen für Konto1 beträgt #{konto1.ueberziehungsrahmen} EUR"
		puts "Höhe des neuen Überziehungsrahmens für Konto2:"
		ue2 = gets.chomp.to_i
		konto2.ueberziehungsrahmen = ue2
		puts "Der Überziehungsrahmen für Konto2 beträgt #{konto2.ueberziehungsrahmen} EUR"
		puts " "
	when "12"

		puts "Wieviel wollen Sie vom Konto 1 abheben?"
		a1 = gets.chomp
		konto1.abheben(a1.to_i)
		puts "Wieviel wollen Sie vom Konto 2 abheben?"
		a2 = gets.chomp
		konto2.abheben(a2.to_i)
	
		puts "Der Kontostand für Konto 1 beträgt #{konto1.kontostand} EUR."
		puts "Der Kontostand für Konto 2 beträgt #{konto2.kontostand} EUR."
	
		puts "Es werden vom Konto1 #{konto1.kontostand+konto1.ueberziehungsrahmen+10} EUR angefordert:"
		konto1.abheben(konto1.kontostand+konto1.ueberziehungsrahmen+10)
		puts "Es werden vom Konto2 #{konto2.kontostand+konto2.ueberziehungsrahmen+10} EUR angefordert:"
		konto2.abheben(konto2.kontostand+konto2.ueberziehungsrahmen+10)
	
		puts "Welches ist das sendende Konto? 1 oder 2"
		se1 = gets.chomp
		puts "Welches ist das empfangende Konto? 1 oder 2"
		em1 = gets.chomp
		puts "Wieviel wollen Sie überweisen?"
		be1 = gets.chomp.to_i
		if se1 == "1"&&em1=="2"
			konto1.ueberweisen(be1,konto2)
		elsif se1 == "2"&&em1=="1"
			konto2.ueberweisen(be1,konto2)
		elsif se1=="1"&&em1=="1"||se1=="2"&&em1=="2"
			puts "Überweisungen auf das gleiche Konto sind nicht möglich!"
		else
			puts "Fehler!"
		end
	
		puts "Es werden vom Konto1 #{konto1.kontostand+konto1.ueberziehungsrahmen+10} EUR an Konto 2 überwiesen:"
		konto1.ueberweisen(konto1.kontostand+konto1.ueberziehungsrahmen+10,konto2)
		puts "Es werden vom Konto2 #{konto2.kontostand+konto2.ueberziehungsrahmen+10} EUR an Konto 1 überwiesen:"
		konto2.ueberweisen(konto2.kontostand+konto2.ueberziehungsrahmen+10,konto1)
	
		puts "Höhe des neuen Überziehungsrahmens für Konto1:"
		ue1 = gets.chomp.to_i
		konto1.ueberziehungsrahmen = ue1
		puts "Der Überziehungsrahmen für Konto1 beträgt #{konto1.ueberziehungsrahmen} EUR"
		puts "Höhe des neuen Überziehungsrahmens für Konto2:"
		ue2 = gets.chomp.to_i
		konto2.ueberziehungsrahmen = ue2
		puts "Der Überziehungsrahmen für Konto2 beträgt #{konto2.ueberziehungsrahmen} EUR"
		puts " "
	when "13"
		a =false
		puts "Auf Wiedersehen!"
	else 
		puts "Fehleingabe"
	end
puts " "
end
