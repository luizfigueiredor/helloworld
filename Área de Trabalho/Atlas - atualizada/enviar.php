<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require __DIR__ . '/vendor/autoload.php';

// Verifica se o formulário foi enviado via POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    exit('Método de requisição inválido.');
}

// Recebe e limpa os dados do formulário
$nome = trim($_POST['nome'] ?? '');
$email = trim($_POST['email'] ?? '');
$msg = trim($_POST['msg'] ?? '');

// Valida os campos
if ($nome === '' || $email === ''|| $msg === '') {
    exit('Preencha todos os campos.');
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    exit('Informe um endereço de e-mail válido.');
}

$mail = new PHPMailer(true);

try {

    $mail->isSMTP();
    $mail->Host       = 'mail.theatlasdev.com.br';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'suporte@theatlasdev.com.br';
    $mail->Password   = '1@Suporteatlas';
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    $mail->Port       = 465;

    // Remetente
    $mail->setFrom(
        'suporte@theatlasdev.com.br',
        'Formulário do site'
    );

    // Destinatário
    $mail->addAddress(
        'suporte@theatlasdev.com.br',
        'Destinatário'
    );

    // Responder para o e-mail informado no formulário
    $mail->addReplyTo(
        $email,
        $nome
    );

    // Conteúdo do e-mail
    $mail->isHTML(true);
    $mail->CharSet = 'UTF-8';

    $mail->Body = '
        <h2>Nova mensagem recebida pelo site</h2>

        <p><strong>Nome:</strong> ' . htmlspecialchars($nome) . '</p>

        <p><strong>E-mail:</strong> ' . htmlspecialchars($email) . '</p>


        <p><strong>Mensagem:</strong></p>

        <p>' . nl2br(htmlspecialchars($msg)) . '</p>
    ';

    // Versão em texto puro
    $mail->AltBody =
        "Nova mensagem recebida pelo site\n\n" .
        "Nome: {$nome}\n" .
        "E-mail: {$email}\n" .
        "Mensagem:\n{$msg}";

    // Envia
    $mail->send();

    echo 'Mensagem enviada com sucesso!';
} catch (Exception $e) {

    echo 'Não foi possível enviar a mensagem.';
}