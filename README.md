# 🤖 Ferdynand

### Opis Projektu
Aplikacja sterująca robotem `Ferdynand`, opracowana we Flutterze, pozwala na bezdotykowe sterowanie ruchem robota. Aplikacja korzysta z rozpoznawania mowy i sensora zbliżeniowego, aby zarządzać trybem ruchu robota w czasie rzeczywistym. W zależności od komend głosowych lub zbliżenia się do przeszkody, robot zmienia kierunek.

### Funkcjonalność
- **Rozpoznawanie Mowy**: `Ferdynand` rozpoznaje komendy głosowe takie jak "do przodu", "do tyłu", "w lewo", "w prawo" i dostosowuje kierunek ruchu robota.
- **Wykrywanie Przeszkód**: Sensor zbliżeniowy wykrywa przeszkody na drodze robota. 
- **Wizualizacja Ruchu**: Każdy tryb ruchu robota jest reprezentowany przez sekwencję kwadratów, która odbierana jest przez fotodiody.
- **Bezdotykowa Obsługa**: Po uruchomieniu aplikacja nie wymaga dodatkowej interakcji – ciągle nasłuchuje komend głosowych i danych z sensora.

### Jak to Działa?
1. **Uruchomienie Aplikacji**  
   Po uruchomieniu aplikacji na urządzeniu, następuje automatyczne przyznanie wymaganych uprawnień do mikrofonu i robot zaczyna ruch "do przodu". Aplikacja nasłuchuje komend głosowych i monitoruje otoczenie robota.

2. **Reakcja na Przeszkody**  
   Gdy sensor wykryje przeszkodę, robot automatycznie przechodzi w tryb "do tyłu" na 3 sekundy, po czym wraca do trybu "do przodu", kontynuując ruch. Pozwala to na unikanie przeszkód bez potrzeby interwencji użytkownika.

3. **Komendy Głosowe**  
   Aplikacja rozpoznaje komendy takie jak "do przodu", "do tyłu", "w lewo" i "w prawo". Na ich podstawie aktualizowany jest kierunek ruchu robota. Po podaniu komendy aplikacja automatycznie przełącza się na nasłuch kolejnych instrukcji, umożliwiając płynne sterowanie bez dotykania ekranu.

### Wizualizacja i Wzorce Ruchu
- **Do Przodu**:
- 
  <br> <img src="https://github.com/user-attachments/assets/09f0421f-5194-432a-9e65-37628017c916" width="400"/>
- **Do Tyłu**: 

  <br> <img src="https://github.com/user-attachments/assets/5932b3b6-2a50-47c0-8b1d-68d2e6d543d0" width="400"/>
- **W Lewo**: 

  <br> <img src="https://github.com/user-attachments/assets/bdf32996-5269-4022-b7b0-308f39893857" width="400"/>
- **W Prawo**:

  <br> <img src="https://github.com/user-attachments/assets/a74e4888-6d61-49ce-9e06-8ba1dd91738e" width="400"/>

### Technologie i Biblioteki
- **Flutter**: Główna technologia użyta do budowy aplikacji.
- **Permission Handler**: Zarządzanie uprawnieniami dostępu do mikrofonu, co jest niezbędne dla rozpoznawania mowy.
- **Proximity Sensor**: Wykrywanie przeszkód na drodze robota.
- **Speech-to-Text**: Tłumaczenie komend głosowych na tekst, który steruje ruchami robota.

### Struktura Projektu
Kod podzielony jest na moduły dla łatwiejszej dostępności:
1. **Widget HomePage**: Główna strona aplikacji, wyświetlająca status robota oraz bieżący tryb ruchu.
2. **Klasa Pattern**: Logika obsługująca wzorce ruchu robota, w zależności od komend głosowych i danych z sensora.
3. **Klasa VoiceControl**: Moduł zarządzający rozpoznawaniem mowy.
4. **Klasa Sensor**: Moduł do obsługi sensora zbliżeniowego.

### Rozwój
W przyszłości projekt można rozszerzyć o:
- **Dodatkowe Komendy Głosowe**: Rozpoznawanie bardziej złożonych instrukcji, takich jak "obrót" czy "stop".
- **Zaawansowane Omijanie Przeszkód**: Wprowadzenie algorytmu, który pozwala na bardziej zaawansowane omijanie przeszkód.
- **Reakcje robota**: Wykorzystanie biblioteki Text-to-Speech, w celu reakcji np. po natrafieniu na przeszkodę.
