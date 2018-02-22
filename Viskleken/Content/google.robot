♥timeoutstep = 100
♥languageCodes = ⊂new string[0]⊃
♥languageUrls = ⊂new string[0]⊃
♥languageNames = ⊂new string[0]⊃ 

➜filesearch
timeout.reset value 99999999
file.exists filename ‴♥appdata\Bitoreq AB\Viskleken\File.txt‴ timeout 99999999 errorjump ➜filesearch
delay milliseconds 100
file.delete filename ‴♥appdata\Bitoreq AB\Viskleken\File.txt‴

window title ‴✱Viskleken - Internet Explorer✱‴ style ‴maximize‴
ie.attach phrase ‴Viskleken‴
jump ➤readLanguages
jump ➤generateUrls
jump ➤translate

jump  ➜filesearch

--(( PROCEDURES ))--

procedure ➤readLanguages    
    ie.getattribute name ‴value‴ search ‴Phrase‴ result phrase
    ie.getattribute name ‴value‴ search ‴Email‴ result email

    ie.runscript script ‴$("input[name='SelectedLanguages']").toArray().map(function(e){return e.value}).filter(function(e){return e}).join("|")‴ result languageCodesString
    ie.runscript script ‴$("input[name='SelectedLanguageNames']").toArray().map(function(e){return e.value}).filter(function(e){return e}).join("|")‴ result languageNamesString

    ♥languageCodes = ⊂♥languageCodesString.Split('|')⊃
    ♥languageNames = ⊂♥languageNamesString.Split('|')⊃
end

procedure ➤generateUrls
    ♥languageUrls = ⊂new string[♥languageCodes⟦count⟧ - 1]⊃
    ♥i=0 
    ➜urlsloop
        ♥i=♥i+1
        ♥languageUrls⟦♥i⟧ = ‴https://translate.google.se/#♥languageCodes⟦♥i⟧/♥languageCodes⟦♥i+1⟧/‴
    jump label ➜urlsloop if ♥i<♥languageUrls⟦count⟧
end

procedure ➤translate
    ♥finalphrase = ⊂new string[♥languageCodes⟦count⟧]⊃
    ♥finalphrase⟦1⟧ = ♥phrase

    jump ➤startbrowser
    ie.attach ‴Google Översätt‴

    keyboard ⋘CTRL+A BS⋙

    ♥iteration = 0
    ➜seturl
    ➜languageloop
        ♥iteration = ♥iteration + 1

        ie.seturl url ♥languageUrls⟦♥iteration⟧

        -clipboard text ♥phrase
        -keyboard ⋘CTRL+V⋙
        keyboard ♥finalphrase⟦♥iteration⟧

        delay seconds 2

        ie.getattribute name ‴value‴ by ‴id‴ search ‴source‴ result source
        delay seconds 2
        ie.runscript script ‴document.getElementById("result_box").innerText‴ result resultbox

        jump ➜cannottranslate if ⊂♥source==♥resultbox⊃

        -ie.click ‴gt-swap‴
        -keyboard ⋘CTRL+A⋙⋘CTRL+C⋙⋘RIGHT⋙
        ♥finalphrase⟦♥iteration + 1⟧ = ♥resultbox
    jump ➜languageloop if ♥iteration<♥languageUrls⟦count⟧

    jump ➜result

    ➜cannottranslate
    ♥finalphrase⟦♥finalphrase⟦count⟧⟧ = ‴Google översätt kan inte översätta frasen‴

    ➜result
    window title ‴✱Viskleken - Internet Explorer✱‴
    ie.attach phrase ‴Viskleken‴
    ie.runscript script ‴$(result).text("♥finalphrase⟦♥finalphrase⟦count⟧⟧")‴
    ie.runscript script ‴$(result).css("visibility", "visible")‴

    ♥emailbody = ⊂"Startfras:\t\t" + ♥phrase + "\n\n"⊃

    ♥iteration = 0
    ➜emailconstruction
        ♥iteration = ♥iteration + 1
        jump ➜sendemail if  ⊂string.IsNullOrEmpty(♥finalphrase⟦♥iteration⟧)⊃
        ♥emailbody = ⊂♥emailbody + ♥languageNames⟦♥iteration⟧ + ":\t\t" + ♥finalphrase⟦♥iteration⟧ + "\n"⊃
    jump ➜emailconstruction if ♥iteration<♥finalphrase⟦count⟧

    ➜sendemail
    ♥emailbody = ⊂♥emailbody + "\nResultat:\t\t" + ♥finalphrase⟦♥finalphrase⟦count⟧⟧⊃

    mail.smtp login ‴viskroboten@gmail.com‴ password ‴DemoDagen‴ from ‴viskroboten@gmail.com‴ to ♥email subject ‴Viskleken‴ body ⊂♥emailbody⊃ errorjump ➜emaildone

    ➜emaildone

end

procedure ➤startbrowser
    window title ‴✱Google Översätt - Internet Explorer✱‴ errorjump ➜startbrowserfail
    jump ➜startbrowsersuccess

    ➜startbrowserfail
    ie.open url ‴https://translate.google.se/‴
    window title ‴✱Google Översätt - Internet Explorer✱‴ errorjump ➜startbrowserfail

    ➜startbrowsersuccess
end
