<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insy · Anmelden</title>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
<style>
:root{
  --tp:#4a1c6b;--tpl:#6b3fa0;--tpp:#f0eaf7;--tg:#c9a84c;--tgl:#e8d08a;--tgp:#fdf8ec;--td:#1a0a2e;
  --bg:#f5f2f8;--white:#fff;--border:#e8e0f0;--muted:#7a6a8a;--danger:#c0392b;
}
*{box-sizing:border-box;margin:0;padding:0}
html,body{font-family:'DM Sans',system-ui,sans-serif;background:var(--tp);min-height:100vh;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:20px}

.logo{text-align:center;margin-bottom:28px}
.logo-label{font-size:10px;letter-spacing:.2em;color:var(--tg);font-weight:600;text-transform:uppercase}
.logo-title{font-size:22px;font-weight:600;color:#fff;margin-top:4px}

.card{background:var(--white);border-radius:16px;padding:32px 28px;width:100%;max-width:400px}

/* Tabs */
.tabs{display:grid;grid-template-columns:1fr 1fr;background:var(--bg);border-radius:10px;padding:3px;margin-bottom:24px}
.tab{text-align:center;padding:8px;font-size:13px;font-weight:500;color:var(--muted);cursor:pointer;border-radius:8px;transition:all .2s}
.tab.active{background:var(--white);color:var(--td);box-shadow:0 1px 4px rgba(74,28,107,.1)}

/* Form */
.field{margin-bottom:14px}
.field label{display:block;font-size:11px;font-weight:500;color:var(--muted);margin-bottom:5px}
.field input{width:100%;border:1.5px solid var(--border);border-radius:8px;padding:10px 12px;font-size:13px;color:var(--td);font-family:inherit;outline:none;transition:border-color .15s}
.field input:focus{border-color:var(--tpl)}

.btn{width:100%;padding:11px;border-radius:10px;font-size:14px;font-weight:500;cursor:pointer;border:none;font-family:inherit;transition:all .15s}
.btn-primary{background:var(--tg);color:var(--td)}.btn-primary:hover{background:var(--tgl)}
.btn-primary:disabled{background:var(--border);color:#aaa;cursor:not-allowed}

.divider{display:flex;align-items:center;gap:10px;margin:16px 0}
.divider span{font-size:11px;color:var(--muted);white-space:nowrap}
.divider hr{flex:1;border:none;border-top:1px solid var(--border)}

.btn-google{width:100%;padding:10px;border-radius:10px;font-size:13px;font-weight:500;cursor:pointer;border:1.5px solid var(--border);font-family:inherit;background:var(--white);color:var(--td);display:flex;align-items:center;justify-content:center;gap:8px;transition:all .15s}
.btn-google:hover{border-color:var(--tpl);background:var(--tpp)}

.error-msg{font-size:12px;color:var(--danger);margin-top:10px;text-align:center;min-height:18px}
.hint{font-size:11px;color:var(--muted);text-align:center;margin-top:16px;line-height:1.6}
</style>
</head>
<body>

<div class="logo">
  <div class="logo-label">Insy Reception</div>
  <div class="logo-title">Willkommen zurück</div>
</div>

<div class="card">
  <div class="tabs">
    <div class="tab active" id="tab-login" onclick="switchTab('login')">Anmelden</div>
    <div class="tab" id="tab-register" onclick="switchTab('register')">Registrieren</div>
  </div>

  <!-- LOGIN -->
  <div id="panel-login">
    <div class="field">
      <label>E-Mail</label>
      <input type="email" id="login-email" placeholder="salon@beispiel.de" autocomplete="email">
    </div>
    <div class="field">
      <label>Passwort</label>
      <input type="password" id="login-pw" placeholder="••••••••" autocomplete="current-password">
    </div>
    <button class="btn btn-primary" id="btn-login" onclick="doLogin()">Anmelden</button>
    <div class="error-msg" id="login-error"></div>

    <div class="divider"><hr><span>oder</span><hr></div>

    <button class="btn-google" onclick="doGoogleLogin()">
      <svg width="16" height="16" viewBox="0 0 24 24"><path d="M21.05 11.1H12v2.8h5.15c-.22 1.17-.9 2.17-1.9 2.83v2.35h3.07c1.8-1.65 2.83-4.1 2.83-7z" fill="#4285F4"/><path d="M12 21c2.59 0 4.76-.86 6.35-2.32l-3.07-2.35c-.85.57-1.95.91-3.28.91-2.52 0-4.66-1.7-5.42-3.98H3.43v2.43C5.01 18.98 8.27 21 12 21z" fill="#34A853"/><path d="M6.58 13.26A5.98 5.98 0 016.2 12c0-.44.07-.87.18-1.28V8.3H3.43A9.97 9.97 0 002 12c0 1.61.39 3.13 1.07 4.46l3.08-2.43z" fill="#FBBC04"/><path d="M12 6.04c1.42 0 2.7.49 3.7 1.44l2.77-2.77C16.75 3.12 14.58 2 12 2 8.27 2 5.01 4.02 3.43 7.04L6.5 9.47c.76-2.28 2.9-3.43 5.5-3.43z" fill="#EA4335"/></svg>
      Mit Google anmelden
    </button>
  </div>

  <!-- REGISTER -->
  <div id="panel-register" style="display:none">
    <div class="field">
      <label>Name</label>
      <input type="text" id="reg-name" placeholder="Dein Name">
    </div>
    <div class="field">
      <label>E-Mail</label>
      <input type="email" id="reg-email" placeholder="salon@beispiel.de" autocomplete="email">
    </div>
    <div class="field">
      <label>Passwort</label>
      <input type="password" id="reg-pw" placeholder="Mindestens 6 Zeichen" autocomplete="new-password">
    </div>
    <div class="field">
      <label>Passwort bestätigen</label>
      <input type="password" id="reg-pw2" placeholder="Passwort wiederholen" autocomplete="new-password">
    </div>
    <button class="btn btn-primary" id="btn-register" onclick="doRegister()">Konto erstellen</button>
    <div class="error-msg" id="register-error"></div>

    <div class="divider"><hr><span>oder</span><hr></div>

    <button class="btn-google" onclick="doGoogleLogin()">
      <svg width="16" height="16" viewBox="0 0 24 24"><path d="M21.05 11.1H12v2.8h5.15c-.22 1.17-.9 2.17-1.9 2.83v2.35h3.07c1.8-1.65 2.83-4.1 2.83-7z" fill="#4285F4"/><path d="M12 21c2.59 0 4.76-.86 6.35-2.32l-3.07-2.35c-.85.57-1.95.91-3.28.91-2.52 0-4.66-1.7-5.42-3.98H3.43v2.43C5.01 18.98 8.27 21 12 21z" fill="#34A853"/><path d="M6.58 13.26A5.98 5.98 0 016.2 12c0-.44.07-.87.18-1.28V8.3H3.43A9.97 9.97 0 002 12c0 1.61.39 3.13 1.07 4.46l3.08-2.43z" fill="#FBBC04"/><path d="M12 6.04c1.42 0 2.7.49 3.7 1.44l2.77-2.77C16.75 3.12 14.58 2 12 2 8.27 2 5.01 4.02 3.43 7.04L6.5 9.47c.76-2.28 2.9-3.43 5.5-3.43z" fill="#EA4335"/></svg>
      Mit Google registrieren
    </button>
  </div>

  <p class="hint" id="login-hint">Noch kein Konto? <span style="color:var(--tpl);cursor:pointer" onclick="switchTab('register')">Jetzt registrieren</span></p>
</div>

<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
<script>
const sb=window.supabase.createClient(
  'https://uzemgxfjgjwqfgfwbboi.supabase.co',
  'sb_publishable__XubcF5yPDyIMpfE7kO9Rg_Xp7kj0hL'
);

const SETUP_URL='https://insy-reception.com/setup.html';

function switchTab(t){
  document.getElementById('tab-login').classList.toggle('active',t==='login');
  document.getElementById('tab-register').classList.toggle('active',t==='register');
  document.getElementById('panel-login').style.display=t==='login'?'block':'none';
  document.getElementById('panel-register').style.display=t==='register'?'block':'none';
  document.getElementById('login-hint').innerHTML=t==='login'
    ?'Noch kein Konto? <span style="color:var(--tpl);cursor:pointer" onclick="switchTab(\'register\')">Jetzt registrieren</span>'
    :'Schon ein Konto? <span style="color:var(--tpl);cursor:pointer" onclick="switchTab(\'login\')">Anmelden</span>';
}

function setLoading(btnId,on){
  var btn=document.getElementById(btnId);
  btn.disabled=on;btn.textContent=on?'Bitte warten…':(btnId==='btn-login'?'Anmelden':'Konto erstellen');
}

async function doLogin(){
  var email=document.getElementById('login-email').value.trim();
  var pw=document.getElementById('login-pw').value;
  document.getElementById('login-error').textContent='';
  if(!email||!pw){document.getElementById('login-error').textContent='Bitte alle Felder ausfüllen.';return;}
  setLoading('btn-login',true);
  var res=await sb.auth.signInWithPassword({email:email,password:pw});
  setLoading('btn-login',false);
  if(res.error){document.getElementById('login-error').textContent=res.error.message;return;}
  window.location.href=SETUP_URL;
}

async function doRegister(){
  var name=document.getElementById('reg-name').value.trim();
  var email=document.getElementById('reg-email').value.trim();
  var pw=document.getElementById('reg-pw').value;
  document.getElementById('register-error').textContent='';
  if(!name||!email||!pw){document.getElementById('register-error').textContent='Bitte alle Felder ausfüllen.';return;}
  if(pw.length<6){document.getElementById('register-error').textContent='Passwort muss mindestens 6 Zeichen haben.';return;}
  var pw2=document.getElementById('reg-pw2').value;
  if(pw!==pw2){document.getElementById('register-error').textContent='Passwörter stimmen nicht überein.';return;}
  setLoading('btn-register',true);
  var res=await sb.auth.signUp({email:email,password:pw,options:{data:{full_name:name}}});
  setLoading('btn-register',false);
  if(res.error){document.getElementById('register-error').textContent=res.error.message;return;}
  window.location.href=SETUP_URL;
}

async function doGoogleLogin(){
  await sb.auth.signInWithOAuth({
    provider:'google',
    options:{redirectTo:SETUP_URL}
  });
}
</script>
</body>
</html>
