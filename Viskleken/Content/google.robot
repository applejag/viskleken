♥timeoutstep = 100
♥notranslation = false
♥languageCodes = ⊂new string[0]⊃
♥languageUrls = ⊂new string[0]⊃
♥languageNames = ⊂new string[0]⊃ 
ie.open url ‴https://translate.google.se/‴
keyboard ⋘WIN+UP⋙
-ie.open url ‴http://localhost:54553‴

➜screensearch
timeout.reset value 99999999
file.exists filename ‴♥appdata\Bitoreq AB\Viskleken\File.txt‴ timeout 99999999 errorjump ➜screensearch
delay milliseconds 100
file.delete filename ‴♥appdata\Bitoreq AB\Viskleken\File.txt‴

window title ‴✱Viskleken✱‴ style ‴maximize‴
ie.attach phrase ‴Viskleken‴

ie.getattribute name ‴value‴ search ‴SelectedLanguageId‴ by ‴Id‴ result selectedLanguages
ie.getattribute name ‴value‴ search ‴Phrase‴ result phrase
clipboard text ♥phrase
ie.getattribute name ‴value‴ search ‴Email‴ result email

➜opentranslate
window title ‴✱Google✱‴ errorjump ➤startbrowser
ie.attach ‴Google Översätt‴

keyboard ‴ ‴⋘CTRL+A BS⋙

procedure ➤readLanguages
    ie.runscript script ‴$("input[name='SelectedLanguages']").toArray().map(function(e){return e.value}).join("|")‴ result languageCodesString
ie.runscript script ‴$("input[name='SelectedLanguageNames']").toArray().map(function(e){return e.value}).join("|")‴ result languageNamesString

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


jump  ➜screensearch

procedure ➤newlanguage languageUrls
    ♥iteration = 1
    ♥finalphrase = ⊂new string[♥languageCodes⟦count⟧]⊃

    ➜languageloop
    ➜seturl

    ie.seturl url ♥languageUrls⟦♥iteration⟧

    keyboard ⋘CTRL+V⋙ 

    delay seconds 2


    ie.getattribute name ‴value‴ by ‴id‴ search ‴source‴ result source
    delay seconds 2
    ie.runscript script ‴document.getElementById("result_box").innerHTML‴ result resultbox
    ♥resultbox = ⊂♥resultbox.Replace("<span>", "").Replace("</span>", "")⊃

    jump ➜cannottranslate if ⊂♥source == ♥resultbox⊃


    ie.click ‴gt-swap‴
    keyboard ‴ ‴⋘CTRL+A⋙⋘CTRL+C⋙⋘RIGHT⋙
    ♥finalphrase⟦♥iteration⟧ = ♥clipboard

    ♥iteration = ♥iteration + 1
    jump ➜languageloop if ⊂♥iteration < 7⊃

    jump ➜result

    ➜cannottranslate
    ♥notranslation = true
    ♥finalphrase⟦6⟧ = ‴Google översätt kan inte översätta frasen‴

    ➜result
    window title ‴✱Viskleken✱‴
    ie.attach phrase ‴Viskleken‴
    ie.setattribute name ‴innerHTML‴ value ♥finalphrase⟦6⟧ search ‴result‴
    ie.runscript script ‴$(result).css("visibility", "visible")‴

    ♥iteration = 1
    ♥emailbody = ⊂"Startfras:\t\t" + ♥phrase + "\n\n"⊃

    jump ➜shortemail if ⊂♥notranslation == true⊃

    ➜emailconstruction

    ♥emailbody = ⊂♥emailbody + ♥languages⟦♥iteration⟧ + ":\t\t" + ♥finalphrase⟦♥iteration⟧ + "\n"⊃

    ♥iteration = ♥iteration + 1
    jump ➜emailconstruction if ⊂♥iteration < 6⊃

    ♥emailbody = ⊂♥emailbody + "\n" + ♥languages⟦♥iteration⟧ + ":\t\t" + ♥finalphrase⟦♥iteration⟧⊃

    jump ➜sendemail if ⊂♥notranslation == false⊃

    ➜shortemail
    ♥emailbody = ⊂♥emailbody + "Resultat:\t\t" + ♥finalphrase⟦6⟧⊃

    ➜sendemail

    mail.smtp login ‴viskroboten@gmail.com‴ password ‴DemoDagen‴ from ‴viskroboten@gmail.com‴ to ♥email subject ‴Viskleken‴ body ⊂♥emailbody⊃ errorjump ➜emaildone

    ➜emaildone

    -♥progress = 0
    -➜progressloop
    -♥progress =♥progress + 10
    -delay 1
    -ie.setattribute name ‴innerHTML‴ value ♥progress search ‴progress-counter‴
    -jump ➜progressloop if ⊂♥progress < 101⊃

end

procedure ➤startbrowser
ie.open url ‴https://translate.google.se/‴
jump ➜opentranslate
end
