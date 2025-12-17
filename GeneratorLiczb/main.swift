import Foundation

// wczytanie danych
func wczytajDane() -> String
{
    if let input = readLine(), !input.isEmpty
    {
        return input
    }
    else{
        print("Podano błędne dane, spróbuj jeszcze raz: ", terminator: "")
        return wczytajDane()
    }
}

// generowanie liczby losowej
func wygenerujLiczbe() -> Int
{
    let liczbaLosowa = Int.random(in: 1...100)
    return liczbaLosowa
}

// funkcja główna - odgadywanie liczby przez użytkownika
func zgadnijLiczbe()
{
    print("Podaj ilość prób w których chcesz odgadnąć liczbę: ", terminator: "")
    let liczbaProb: Int = Int(wczytajDane()) ?? 0
    var wykorzystaneProby = 0
    let wylosowanaLiczba = wygenerujLiczbe()
    
    // główna pętla programu
    while liczbaProb > wykorzystaneProby
    {
        print("Pozostało prób: \(liczbaProb - wykorzystaneProby)")
        print("Podaj liczbę: ", terminator: "")
        let input = wczytajDane()
        
        // walidacja żeby stała przyjmowała tylko Inty
        guard let guess = Int(input), guess > 0 else
        {
            print("Podano błędne dane!")
            continue
        }
        
        // sprwadzenie typu użytkownika
        if guess == wylosowanaLiczba
        {
            print("Gratulacje udało ci się zgadnąć za \(wykorzystaneProby + 1) razem. \n")
            break
        }
        else if guess > wylosowanaLiczba
        {
            print("Celuj niżej! \n")
        }
        else if guess < wylosowanaLiczba
        {
            print("Celuj wyżej! \n")
        }
        wykorzystaneProby += 1
    }
}

// wykonanie programu
zgadnijLiczbe()

