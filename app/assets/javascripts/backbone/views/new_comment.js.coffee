
class Tickets.NewCommentView extends Tickets.FormViewBase

  templateName: 'new_comment'

  fields:
    full_name:
      required: true
      elAttributes:
        size: "60"
        placeholder: "Your name"
    body:
      elAttributes:
        rows: "3"
        cols: "60"
        placeholder: "Your comment..."

