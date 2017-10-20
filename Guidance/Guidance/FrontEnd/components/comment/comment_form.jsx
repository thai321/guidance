import React from 'react';

import ReactQuill from 'react-quill';

import Delta from 'quill-delta';

class CommentForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {};

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(value) {
    if (value === '<p><br></p>') value = null;
    this.setState({ description: value });
  }

  componentWillMount() {
    this.setState(this.props.comment);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props
      .createComment(this.state)
      .then(() => this.setState({ description: '' }));
  }

  render() {
    return (
      <div className="comment-form">
        <form className="comment-form-actual" onSubmit={this.handleSubmit}>
          <ReactQuill
            className="comment-quill"
            modules={CommentForm.modules}
            value={this.state.description || ''}
            onChange={this.handleChange}
          />
          <div className="comment-btn">
            <input className="btn btn-primary" type="submit" value="Submit" />
          </div>
        </form>
      </div>
    );
  }
}

CommentForm.modules = {
  syntax: true,
  formula: true,
  toolbar: [
    [{ header: '1' }, { header: '2' }, { font: [] }],
    [{ color: [] }, { background: [] }],
    [{ size: [] }],
    ['bold', 'italic', 'underline', 'strike', 'blockquote'],

    [
      { list: 'ordered' },
      { list: 'bullet' },
      { indent: '-1' },
      { indent: '+1' }
    ],
    ['link', 'image', 'video', 'code-block', 'formula']
  ]
};

export default CommentForm;
