<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class BlogMail extends Mailable
{
    use Queueable, SerializesModels;

    public $blogDetails;
    /**
     * Create a new message instance.
     */
    public function __construct($blogDetails)
    {
        $this->blogDetails = $blogDetails;
    }

    public function build()
    {
        return $this->subject($this->blogDetails['subject'])->html('<p>'.$this->blogDetails['body'].'</p>');
    }

    /**
     * Get the message envelope.
     */
    // public function envelope(): Envelope
    // {
    //     return new Envelope(
    //         from: ('kiel@email.com', 'Kiel Garcia'),
    //         subject: 'Blog Mail',
    //     );
    // }

    // /**
    //  * Get the message content definition.
    //  */
    // public function content(): Content
    // {
    //     return new Content(
    //         view: 'view.name',
    //     );
    // }

    // /**
    //  * Get the attachments for the message.
    //  *
    //  * @return array<int, \Illuminate\Mail\Mailables\Attachment>
    //  */
    // public function attachments(): array
    // {
    //     return [];
    // }
}
