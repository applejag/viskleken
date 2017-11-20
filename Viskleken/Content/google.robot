♥timeoutstep = 100
♥notranslation = false
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

-ie.click ‴gt-sl-gms‴
-ocr.findpoint ‴svenska‴ area (rectangle)32,363,1279,719 result mousePoint 
-mouse.click ♥mousePoint
jump ➤newlanguage languageUrls ‴https://translate.google.se/?hl=sv&tab=wT#sv/la/‴❚‴https://translate.google.se/?hl=sv&tab=wT#la/jw/‴❚‴https://translate.google.se/?hl=sv&tab=wT#jw/gd/‴❚‴https://translate.google.se/?hl=sv&tab=wT#gd/kn/‴❚‴https://translate.google.se/?hl=sv&tab=wT#kn/ur/‴❚‴https://translate.google.se/?hl=sv&tab=wT#ur/sv/‴ languages ‴Latin‴❚‴Javanesiska‴❚‴Gaeliska‴❚‴Kanaresiska‴❚‴Urdu‴❚‴Resultat‴ if ⊂♥selectedLanguages == "1"⊃ 
jump ➤newlanguage languageUrls ‴https://translate.google.se/?hl=sv&tab=wT#sv/iw/‴❚‴https://translate.google.se/?hl=sv&tab=wT#iw/ny/‴❚‴https://translate.google.se/?hl=sv&tab=wT#ny/gu/‴❚‴https://translate.google.se/?hl=sv&tab=wT#gu/hi‴❚‴https://translate.google.se/?hl=sv&tab=wT#hi/mi/‴❚‴https://translate.google.se/?hl=sv&tab=wT#mi/sv/‴ languages ‴Hebreiska‴❚‴Chichewa‴❚‴Gujarati‴❚‴Hindi‴❚‴Maori‴❚‴Resultat‴ if ⊂♥selectedLanguages == "2"⊃ 
jump ➤newlanguage languageUrls ‴https://translate.google.se/?hl=sv&tab=wT#sv/pl/‴❚‴ https://translate.google.se/?hl=sv&tab=wT#pl/hmn/‴❚‴https://translate.google.se/?hl=sv&tab=wT#hmn/xh/‴❚‴ https://translate.google.se/?hl=sv&tab=wT#xh/ps/‴❚‴https://translate.google.se/?hl=sv&tab=wT#ps/is‴❚‴ https://translate.google.se/?hl=sv&tab=wT#is/sv‴ languages ‴Polska‴❚‴Hmong‴❚‴Xhosa‴❚‴Pashto‴❚‴Isländska‴❚‴Resultat‴ if ⊂♥selectedLanguages == "3"⊃
jump ➤newlanguage languageUrls ‴https://translate.google.se/?hl=sv&tab=wT#sv/sw/‴❚‴https://translate.google.se/?hl=sv&tab=wT#sw/ig/‴❚‴https://translate.google.se/?hl=sv&tab=wT#ig/fy/‴❚‴https://translate.google.se/?hl=sv&tab=wT#fy/tg‴❚‴https://translate.google.se/?hl=sv&tab=wT#tg/sd/‴❚‴https://translate.google.se/?hl=sv&tab=wT#sd/sv/‴ languages ‴Swahili‴❚‴Igbo‴❚‴Frisiska‴❚‴Tadzjikiska‴❚‴Sindhi‴❚‴Resultat‴ if ⊂♥selectedLanguages == "4"⊃
jump ➤newlanguage languageUrls ‴https://translate.google.se/?hl=sv&tab=wT#sv/mr/‴❚‴https://translate.google.se/?hl=sv&tab=wT#mr/ky/‴❚‴https://translate.google.se/?hl=sv&tab=wT#ky/ta/‴❚‴https://translate.google.se/?hl=sv&tab=wT#ta/eo‴❚‴https://translate.google.se/?hl=sv&tab=wT#eo/da/‴❚‴https://translate.google.se/?hl=sv&tab=wT#da/sv/‴ languages ‴Marathi‴❚‴Kirgiziska‴❚‴Tamil‴❚‴Esperanto‴❚‴Danska‴❚‴Resultat‴ if ⊂♥selectedLanguages == "5"⊃
jump  ➜screensearch

procedure ➤newlanguage languageUrls ‴one‴❚‴two‴❚‴three‴❚‴four‴❚‴five‴❚‴six‴ languages ‴one‴❚‴two‴❚‴three‴❚‴four‴❚‴five‴❚‴six‴
♥iteration = 1
♥finalphrase = ‴one‴❚‴two‴❚‴three‴❚‴four‴❚‴five‴❚‴six‴
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
-dialog ♥finalphrase⟦♥iteration⟧

-♥progress = ⊂(♥iteration*10).ToString()⊃
-window title ‴✱My ASP.NET Application✱‴
-ie.attach phrase ‴- My ASP.NET Application‴
-ie.setattribute name ‴innerHTML‴ value ♥progress search ‴progress-counter‴



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
