def fromRoman(romanNumber)
    conversionArabic = {"M" => 1000,
                        "D" => 500,
                        "C" => 100,
                        "L" => 50,
                        "X" => 10,
                        "V" => 5,
                        "I" => 1}
    resultA = 0
    # bar operator implementation found on stackoverflow, saves a few lines
    romanNumber.each_char {|ch|
        unless conversionArabic.keys.include? ch
            raise TypeError
        end }
    # could also do 1..3999?, instead of subtracting from length total
    for n in 0..romanNumber.length - 1
        if n > 0 and conversionArabic[romanNumber[n]] > conversionArabic[romanNumber[n - 1]]
            resultA += conversionArabic[romanNumber[n]] - 2 * conversionArabic[romanNumber[n - 1]]
        else
            resultA += conversionArabic[romanNumber[n]]
        end
    end
    resultA
end

def toRoman(arabicNumber)
    conversionRoman = {1000 => "M",
                       900 => "CM",
                       500 => "D",
                       400 => "CD",
                       100 => "C",
                       90 => "XC",
                       50 => "L",
                       40 => "XL",
                       10 => "X",
                       9 => "IX",
                       5 => "V",
                       4 => "IV",
                       1 => "I"}
    if arabicNumber > 3999 or arabicNumber < 1
        raise RangeError
    end
    romanNumeral = ""
    n = 0
    while arabicNumber > 0
        result = arabicNumber.div conversionRoman.keys[n]
        # bar operator implementation found on stackoverflow, saves a few lines
        result.times do |_|
            romanNumeral += conversionRoman.values[n]
            arabicNumber -= conversionRoman.keys[n]
        end
        romanNumeral
    end
end