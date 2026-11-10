[title name="mainブランチに君はいない"]
[hidemenubutton]
; ==================================================
; 1. 初期設定（first.ks やシナリオの冒頭）
; ==================================================

; メッセージレイヤと名前表示領域（ptext）の作成
[position layer="message0" page="fore" color="0x000000" opacity=200 left=180 top=480 width=920 height=200 marginl=30 margint=30 marginr=30 marginb=30]
[ptext layer="message0" name="chara_name_area" color="white" size=24 x=200 y=440 bold="true"]

; ★重要：名前表示領域として chara_name_area を登録
[chara_config ptext="chara_name_area"]

; 「こうへい」をキャラクターとして登録（jnameが表示名になります）
[chara_new name="kouhei" jname="こうへい" storage="chara/kouhei.png"]


; ==================================================
; 2. ユーザー名の入力と確定
; ==================================================
[cm]
名前を入力してください。[r][r]

[edit name="f.player_name" left=440 top=300 width=400 height=40 maxchars=10 default="あかね"]
[glink target="*name_submit" text="決定" color="white" x=540 y=380 width=150 size=20 exp="TYRANO.kag.ftag.startTag('commit', {})"]
[s]

*name_submit
[cm]
[layopt layer="message0" visible=true]


*title
[eval exp="f.tag_good=false; f.tag_bad=false; f.tag_normal=false; f.tag_good2=false; f.tag_bad2=false; f.tag_normal2=false;"]
「mainブランチに君はいない」[l][r]
[cm]
git init[l][r]
[cm]

;背景
[bg storage="sunset.png" time=0]

; メッセージレイヤの設定（画面下に配置）
[position layer="message0" page="fore" color="0x000000" opacity=200 left=180 top=480 width=920 height=200 marginl=30 margint=40 marginr=30 marginb=30]

; --- 名前欄の追加設定 ---


; 2. 名前表示用テキスト領域の定義
[ptext layer="message0" name="chara_name_area" color="white" size=24 x=200 y=440 bold="true"]

; 3. 名前表示領域としてティラノスクリプトに登録
[chara_config ptext="chara_name_area"]

; --- カレントレイヤーの設定と表示 ---
[current layer="message0"]
[layopt layer="message0" visible=true]

[cm]

#
2026/11/02[l][p]
#kouhei
「今日のソフトウェア開発演習の授業、疲れたな～」[l][p]

#&f.player_name
「それな。Gitって難しくない？」[l][p]
「演習のゲーム作成、時間足りなかったから家でまたやるわ。」[l][p]
「こうへいはどうだった？」[l][p]

#kouhei
「俺、プレイヤーの『巻き戻し機能』を実装したくてさ。」[l][p]
「別ブランチを切って実験してたんだけど、、プレイヤーの位置履歴を記録する配列の処理でバグって、メイン処理にマージできなくなっちゃったんだよ。」[l][p]
「締め切りも近いし、巻き戻し機能自体を諦めて変更を全部破棄したほうがいいかな、、」[l][p]

[cm]
[nowait]
#&f.player_name
[font size=20]
[link target=*tag_good exp="f.tag_good = true"] →「めっちゃ面白いじゃん！バグってる箇所のコミットだけ取り消して、明日一緒にデバッグしよう」 [endlink][r]
[link target=*tag_bad exp="f.tag_bad = true"] →「締め切り優先でしょ。未完成のブランチなんて即削除して、動くやつだけ提出しなよ。」 [endlink][r]
[link target=*tag_normal exp="f.tag_normal = true"] →「渡辺先生に『巻き戻し機能は未実装です』って注記してそのままマージしちゃえば？」 [endlink][r]
[resetfont]
[endnowait]
[s]

*tag_good
[cm]
[eval exp="f.tag_good = true"]
#kouhei
「、、、ありがとう！諦めずに機能残してみるわ。」[l][r]
[cm]
[jump storage=first.ks target=*quest2]

*tag_bad
[eval exp="f.tag_bad = true"]
[cm]
#kouhei
「、、、まあ、正論だけどさ。苦労して書いたコードなんだから、そんな簡単に切り捨てられねーよ。」[l][r]
[cm]
[jump storage=first.ks target=*quest2]

*tag_normal
[eval exp="f.tag_normal = true"]
[cm]
#kouhei
「それは流石に採点引かれそうだけどな～」[l][r]
[cm]
[jump storage=first.ks target=*quest2]

*quest2
#kouhei
「、、、あ、そういえばさ。[l][r]
この巻き戻し機能付きのゲーム、もし無事に完成したら、一番最初にお前にプレイしてほしいんだよね」[l][p]

#&f.player_name
「俺に？」[l][p]

#kouhei
「うん。[l][r]
実はプレイヤーだけじゃなくて、ステージのギミックも巻き戻るようにしたくてさ。」[l][p]
もし完成したら、俺がなんでこの『やり直し』の機能にここまで拘ったのか、[l][r]
お前なら分かってくれる気がするんだ。[l][r]
変かな？」[l][p]

[cm]
#&f.player_name
[nowait]
[link target=*tag_good2 exp="f.tag_good2 = true"] →「変じゃないよ。完成したら一緒に遊ぼう。」 [endlink][r]
[link target=*tag_bad2 exp="f.tag_bad2 = true"] →「別に完成しなくても、見せてくれればいいじゃん。変な奴。」 [endlink][r]
[link target=*tag_normal2 exp="f.tag_normal2 = true"] →「まあ、締切に間に合ってバグが出なければ何でもいいんじゃね？」 [endlink][r]
[endnowait]
[s]

*tag_good2
[cm]
[eval exp="f.tag_good2 = true"]
#kouhei
「はは、楽しみにしてるよ！ [l][r]
よし、絶対に完成させるぞ」[l][r]
[cm]
[jump storage=first.ks target=*ending]

*tag_bad2
[eval exp="f.tag_bad2 = true"]
[cm]
#kouhei
「、、そういうことじゃないんだけどな。[l][r]
んー、まあいいや、、」[l][r]
[cm]
[jump storage=first.ks target=*ending]

*tag_normal2
[eval exp="f.tag_normal2 = true"]
[cm]
#kouhei
「んーまあお前らしいわ。」[l][r]
[cm]
[jump storage=first.ks target=*ending]

*ending
[if exp="(f.tag_good || f.tag_bad || f.tag_normal) && f.tag_good2"]
[bg storage="cross.png" time="500"]
#
綱島街道沿いの信号が青に変わる。[l][p]
こうへいは笑顔で一歩踏み出そうとする。[l][p]
その瞬間、遠くから猛スピードで接近するトラックの排気音とクラクションが響き渡る。[l][p]

#&f.player_name
（あのトラック、速度が速すぎないか？）[l][p]
（おいおい、こっちに突っ込んでくるぞ！！！）[l][p]

→「危ない！」と叫んで、こうへいの上着の袖を強く引く[l][p]

「待て！ 車が来る！！」[l][p]

#
強引に引っ張られたこうへいの体が、歩道側に引き戻される。[l][p]
そのわずか数十センチ先を、大型トラックが強烈な風圧とともに走り抜けていった。[l][p]

#kouhei
「！！！！うおっ、、！」[l][p]

#
トラックが走り去り、静まり返る横断歩道。[l][p]
こうへいは尻餅をついたまま、驚きで目を丸くしてトラックの去った方と俺を交互に見つめている。[l][p]

#kouhei
「、、あ、危なかった、、。[l][r]
全然前見てなかったわ、、[l][r]
まじでありがとな。お前が袖引っ張ってくれなかったら、俺、本当に跳ねられてたわ。」[l][p]

#&f.player_name
「、、無事でよかった。まじでびびったわ、、[l][r]
本当に、、よかった、、、」[l][p]
安堵のあまり、膝の力が抜けそうになるのを必死に耐える。[l][p]

#kouhei
「、、立ち上がったら、ちょっと膝笑ってるわ、、[l][r]
さっき演習課題のバグ、一緒に直そうって言ってくれた時も思ったけど、[l][r]
やっぱりお前と一緒に帰れてよかったよ。」[l][p]
「なあ、駅前のカフェで少し休まねえ？ 奢るからさ。[l][r]
ゲームの巻き戻し機能の話、もっと聞いてほしいんだ」[l][p]

#&f.player_name
「ああ、、喜んで。」[l][p]

#
二人は顔を見合わせて微笑み合い、安全になった信号を渡って日吉駅へと向かっていく。[l][p]

[cm]
[bg storage="bg_default.png" time="1000"]
================================================== [r]
SUCCESS: Clean build. Merge request accepted to main branch. Loop process terminated successfully. [r]
==================================================[l][r]
[cm]

Thank you for playing.


[elsif exp="(f.tag_bad && f.tag_bad2) || (f.tag_bad && f.tag_normal2) || (f.tag_normal && f.tag_bad2)"]
[bg storage="cross.png" time="500"]
#
「「、、、、、」」[l][p]

#
沈黙が広がる。[l][p]
こうへいは青信号の横断歩道へ一歩を踏み出す。[l][p]

#&f.player_name
（あのトラック、速度が速すぎないか？）[l][p]
（おいおい、こっちに突っ込んでくるぞ！！！）[l][p]

→（あ、危ない——！！）[l][p]


#
制止の声をかけようとした瞬間、視界の端から猛スピードの影が飛び込んでくる。[l][p]
キーーーッ！！！（激しいブレーキ音）[l][p]

#
鈍い衝撃音とともに、こうへいの体が空中に弾き飛ばされる。[l][p]
視界が急激に赤く染まり、友人の叫び声も、街の喧騒も、すべてが遠のいていく。[l][p]

#&f.player_name
「おい嘘だろ、、！！」[l][p]

#
倒れたこうへいに駆け寄ろうとする。[l][p]
視界に、幾重ものノイズと黒いターミナル画面が覆いかぶさる。[l][p]

[cm]
[bg storage="bg_default.png" time="1000"]
==================================================[r]
 Fatal error: Segmentation fault in Friend_Life_Process.[r]
 System execution interrupted at Hiyoshi_Crosswalk.[l][p]
 
 Reverting repository to previous commit...[r]
 git checkout main && git reset --hard HEAD~1[r]
==================================================[l][r]
[cm]

[bg storage="sunset.png" time="2000"]
#kouhei
「今日のソフトウェア開発演習の授業、疲れたな～」[l][p]

#
冬の夕暮れ、すっかり日が落ちかけた矢上坂。[l][p]
こうへいが、何事もなかったかのように隣で笑いかけている。[l][p]

#&f.player_name
「、、、」[l][p]

#
答えようとして、喉の奥で言葉が引っかかった。[l][p]
坂道を照らす街灯が一瞬だけ明滅し、デジャヴのような既視感が胸を掠める。[l][p]
いつか見たこのオレンジ色の夕暮れを、自分は前にもここから眺めていたような気がした。[l][p]

[cm]
[bg storage="bg_default.png" time="3000"]
To Be Continued...?[l][p]
[jump storage=first.ks target=*title]


[else]
[bg storage="cross.png" time="500"]
#
気まずい沈黙のまま、綱島街道の横断歩道へ差し掛かる。[l][p]
こうへいは俺から逃げるように、青信号になった瞬間に早足で歩き出す。[l][p]
その瞬間、遠くから猛スピードで接近するトラックの排気音とクラクションが響き渡る。[l][p]

#&f.player_name
（あのトラック、速度が速すぎないか？）[l][p]
（おいおい、こっちに突っ込んでくるぞ！！！）[l][p]
→体を投げ出して、友人を歩道へ突き飛ばす[l][p]

#
「！！！！」[l][p]

#
こうへいの背中に飛びかかり、二人もつれ合うように歩道へ倒れ込む。[l][p]
直後、目の前を巨大な車体が猛スピードで通り過ぎ、アスファルトを激しい金属音が揺らした。[l][p]

#kouhei
「痛っ、、！な、何するんだよ急に、、！？」[l][p]

#
地べたに倒れ込んだこうへいが、怒りと困惑の混ざった声を上げる。[l][p]
しかし、目の前を走り去るトラックのリアランプを見て、自分が危機一髪だったことに気づく。[l][p]

#kouhei
「、、あ、、、、」[l][p]

#&f.player_name
「ちゃんと前みて歩けよ！！車が来てただろ！！」[l][p]

#kouhei
「、、っ。助けてくれたのは、、わかったよ。」[l][p]
「 でも、そんな乱暴に突き飛ばさなくたっていいじゃん、、膝、すりむいちゃったよ」[l][p]

#
こうへいは立ち上がり、服の汚れを払うが、俺と視線を合わせようとしない。[l][p]

#kouhei
「、、助けてくれて、ありがとう。」[l][p]
「 でも、、今日はなんか疲れたから、一人で帰るわ。[l][r]
 演習課題のコードも、一人で全部リセットしてやり直すよ。じゃあな」[l][p]

#
俺の制止を待たず、こうへいは背中を向けて改札の中へ消えていく。[l][p]
一人残された俺は、助けられた安堵感と、こうへいのよそよそしい態度に立ち尽くす。[l][p]

[cm]
[bg storage="bg_default.png" time="1000"]
==================================================[r]
 WARNING: Force-pushed to main with unresolved conflicts.[r]
 Unsaved emotional progress lost.[r]
==================================================[l][p]

To Be Continued...? [l][p]

[jump storage=first.ks target=*title]

[endif]


