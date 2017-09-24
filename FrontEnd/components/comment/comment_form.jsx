import React from 'react';

import ReactQuill from 'react-quill';

class CommentForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = this.props.comment;
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(value) {
    this.setState({ body: value });
  }

  // componentDidMount() {
  //   const {}
  // }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createComment(this.state);
    this.setState({ body: '' });
  }

  render() {
    return (
      <div className="comment-form">
        <div className="container">
          <div className="row">
            <div className="col-md-10">
              <form className="form-horizontal" onSubmit={this.handleSubmit}>
                <ReactQuill
                  className="comment-quill"
                  modules={CommentForm.modules}
                  value={this.state.body}
                  onChange={this.handleChange}
                />
                <div className="comment-btn">
                  <input
                    className="btn btn-primary"
                    type="submit"
                    value="Submit"
                  />
                </div>
              </form>
            </div>
          </div>
        </div>
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
