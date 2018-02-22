♥timeoutstep = 100
♥languageCodes = ⊂new string[0]⊃
♥languageUrls = ⊂new string[0]⊃
♥languageNames = ⊂new string[0]⊃ 

file.delete filename ‴♥appdata\Bitoreq AB\Viskleken\File.txt‴

➜filesearch
timeout.reset value 99999999
file.exists filename ‴♥appdata\Bitoreq AB\Viskleken\File.txt‴ timeout 99999999 errorjump ➜filesearch
delay milliseconds 100
file.delete filename ‴♥appdata\Bitoreq AB\Viskleken\File.txt‴

window title ‴✱Viskleken - Internet Explorer✱‴ style ‴maximize‴

jump ➤readLanguages
jump ➤generateUrls
jump ➤translate
jump ➤sendEmail

jump ➤setProgress percent (float)1.0 comment ‴Klar!‴
delay seconds 2

jump ➤hideProgress
jump  ➜filesearch

--(( PROCEDURES ))--

procedure ➤readLanguages
    jump ➤setProgress percent 0.1 comment ‴Läser in fras...‴

    ie.getattribute name ‴value‴ search ‴Phrase‴ result phrase
    ie.getattribute name ‴value‴ search ‴Email‴ result email

    jump ➤setProgress percent 0.2 comment ‴Läser in språk...‴

    ie.runscript script ‴$("input[name='SelectedLanguages']").toArray().map(function(e){return e.value}).filter(function(e){return e}).join("|")‴ result languageCodesString
    ie.runscript script ‴$("input[name='SelectedLanguageNames']").toArray().map(function(e){return e.value}).filter(function(e){return e}).join("|")‴ result languageNamesString

    ♥languageCodes = ⊂♥languageCodesString.Split('|')⊃
    ♥languageNames = ⊂♥languageNamesString.Split('|')⊃
end

procedure ➤generateUrls
    jump ➤setProgress percent 0.25 comment  ‴Genererar URL:er...‴

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

    ♥iteration = 0
    
    jump ➤setProgress percent 0.28 comment  ‴Öppnar Google Translate...‴
    jump ➤startbrowser

    ➜languageloop
        ♥iteration = ♥iteration + 1

        -- PROGRESS 0.3 -> 0.75
        jump ➤setProgress percent  ⊂0.3f+0.45f*♥iteration/♥languageUrls⟦count⟧⊃ comment  ‴Översätter till ♥languageNames⟦♥iteration+1⟧...‴

        ie.attach phrase ‴Google Översätt‴
        ie.seturl url ♥languageUrls⟦♥iteration⟧

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
    ie.close
    jump ➤setProgress percent 0.8 comment  ‴Översättning klar.‴

    window title ‴✱Viskleken - Internet Explorer✱‴
    ie.attach phrase ‴Viskleken‴
    ie.runscript script ‴$(result).text("♥finalphrase⟦♥finalphrase⟦count⟧⟧")‴
    ie.runscript script ‴$(result).css("visibility", "visible")‴
end

procedure ➤sendEmail
    jump ➤setProgress percent 0.85 comment ‴Konstruerar e-mail...‴
    ♥emailbody = ⊂"Startfras:\t\t" + ♥phrase + "\n\n"⊃

    ♥iteration = 0
    ➜emailconstruction
        ♥iteration = ♥iteration + 1
        jump ➜sendemail if  ⊂string.IsNullOrEmpty(♥finalphrase⟦♥iteration⟧)⊃
        ♥emailbody = ⊂♥emailbody + ♥languageNames⟦♥iteration⟧ + ":\t\t" + ♥finalphrase⟦♥iteration⟧ + "\n"⊃
    jump ➜emailconstruction if ♥iteration<♥finalphrase⟦count⟧

    ➜sendemail
    ♥emailbody = ⊂♥emailbody + "\nResultat:\t\t" + ♥finalphrase⟦♥finalphrase⟦count⟧⟧⊃

    jump ➤setProgress percent 0.9 comment ‴Skickar e-mail...‴
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

procedure ➤setProgress percent (float)0.0 comment ‴‴
    ie.attach ‴Viskleken‴
    ie.runscript script ‴setProgress(♥percent, "♥comment")‴
end

procedure ➤hideProgress
    ie.attach ‴Viskleken‴
    ie.runscript ‴hideProgress()‴
end
