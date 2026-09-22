// ===================================================
// ALTERNAR TEMA CLARO / ESCURO
// Ao clicar no botão, adiciona ou remove o atributo
// data-theme="light" na tag <html>, que é o que o CSS
// usa para saber qual conjunto de cores aplicar.
// A escolha da pessoa é salva no navegador (localStorage),
// então da próxima vez que ela abrir o site, o tema
// escolhido continua o mesmo.
// ===================================================
const themeToggle = document.getElementById('theme-toggle');
const root = document.documentElement; // é a tag <html>

// Ao carregar a página, verifica se já existe um tema salvo
const savedTheme = localStorage.getItem('atlas-theme');
if (savedTheme === 'light') {
  root.setAttribute('data-theme', 'light');
}

themeToggle?.addEventListener('click', () => {
  const isLight = root.getAttribute('data-theme') === 'light';

  if (isLight) {
    root.removeAttribute('data-theme'); // volta pro tema escuro (padrão)
    localStorage.setItem('atlas-theme', 'dark');
  } else {
    root.setAttribute('data-theme', 'light'); // ativa o tema claro
    localStorage.setItem('atlas-theme', 'light');
  }
});

// ===================================================
// TELA DE CARREGAMENTO (LOADER)
// Quando a página termina de carregar tudo (imagens, fontes etc.),
// esperamos 1,9 segundo e depois escondemos a tela preta com "Atlas".
// ===================================================
window.addEventListener('load', () => {
  setTimeout(() => {
    document.getElementById('loader').classList.add('done');
  }, 1900);
});

// ===================================================
// ANIMAÇÃO "APARECER AO ROLAR" (scroll reveal)
// Pega todos os elementos com a classe "reveal" (que começam invisíveis)
// e fica observando: quando 15% do elemento entra na tela,
// adiciona a classe "in", que o CSS usa para mostrá-lo suavemente.
// Depois de aparecer uma vez, para de observar (não repete).
// ===================================================
const reveals = document.querySelectorAll('.reveal');
const obs = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('in');
      obs.unobserve(entry.target);
    }
  });
}, { threshold: 0.15 });
reveals.forEach(el => obs.observe(el));

// ===================================================
// EFEITO DE PROFUNDIDADE (PARALLAX) NA BOLHA DE LUZ DO HERO
// Conforme o mouse se move pela tela, a bolha de luz de fundo
// se desloca um pouquinho na direção contrária, criando
// sensação de profundidade.
// ===================================================
const glow = document.querySelector('.hero-glow');
window.addEventListener('mousemove', (e) => {
  if (!glow) return; // se não existir esse elemento na página, não faz nada
  const x = (e.clientX / window.innerWidth - 0.5) * 30;
  const y = (e.clientY / window.innerHeight - 0.5) * 30;
  glow.style.transform = `translate(${x}px, ${y}px)`;
});

// ===================================================
// ROTAÇÃO SUTIL DE UM "NÓ" (ELEMENTO COM ID "atlasKnot")
// Se existir um elemento com esse id na página, ele gira devagar
// conforme a pessoa rola a tela para baixo.
// Obs: esse elemento não aparece no HTML atual, então esse trecho
// fica "adormecido" até que ele seja adicionado em algum lugar.
// ===================================================
const knot = document.getElementById('atlasKnot');
window.addEventListener('scroll', () => {
  if (!knot) return;
  const scrolled = window.scrollY;
  const rotate = (scrolled * 0.02) % 360;
  knot.style.transformOrigin = '200px 240px';
  knot.style.transform = `rotate(${rotate * 0.3}deg)`;
});

// ===================================================
// BOTÃO DE MENU MOBILE (versão simples/provisória)
// Ao clicar no botão "Menu" (que só aparece no celular),
// o código passa por todos os links do menu e rola a tela
// até o último deles. É um comportamento bem básico —
// ainda não abre/fecha um menu de verdade.
// ===================================================
document.querySelector('.menu-toggle')?.addEventListener('click', () => {
  document.querySelectorAll('.nav-links a').forEach((a) => {
    a.scrollIntoView();
  });
});

const form = document.getElementById("contact-form");

form?.addEventListener("submit", async (e) => {
  e.preventDefault();

  const submitBtn = form.querySelector("button[type='submit']");
  const originalText = submitBtn.textContent;

  submitBtn.disabled = true;
  submitBtn.textContent = "Enviando...";

  try {
    const resposta = await fetch("enviar.php", {
      method: "POST",
      body: new FormData(form)
    });

    const json = await resposta.json().catch(() => ({
      success: false,
      message: "Não foi possível receber a resposta do servidor."
    }));

    alert(json.message || "Erro inesperado ao enviar mensagem.");

    if (json.success) {
      form.reset();
    }
  } catch (error) {
    console.error("Erro no envio:", error);
    alert("Não foi possível enviar a mensagem. Verifique a conexão e a configuração do e-mail.");
  } finally {
    submitBtn.disabled = false;
    submitBtn.textContent = originalText;
  }
});