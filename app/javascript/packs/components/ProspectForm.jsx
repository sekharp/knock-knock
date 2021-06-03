import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import axios from 'axios'

class ProspectForm extends React.Component {
  constructor(props) {
    super(props)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.nameRef = React.createRef()
    this.emailRef = React.createRef()
    this.notesRef = React.createRef()
  }

  handleSubmit(e) {
    e.preventDefault()
    axios
      .post('/api/v1/prospects', {
        prospect: {
          name: this.nameRef.current.value,
          email: this.emailRef.current.value,
          notes: this.notesRef.current.value,
        },
      })
      .then(response => {
        const prospect = response.data
        this.props.createProspect(todoItem)
      })
      .catch(error => {
        console.log(error)
      })
    e.target.reset()
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit} className="my-3">
        <div className="form-row">
          <div className="form-group col-12">
            <input
              type="text"
              name="name"
              ref={this.nameRef}
              required
              className="form-control"
              id="name"
              placeholder="Write the prospect name here..."
            />
          </div>
          <div className="form-group col-12">
            <input
              type="text"
              name="email"
              ref={this.emailRef}
              required
              className="form-control"
              id="email"
              placeholder="Write the prospect email here..."
            />
          </div>
          <div className="form-group col-12">
            <input
              type="text"
              name="notes"
              ref={this.nameRef}
              required
              className="form-control"
              id="notes"
              placeholder="Write the prospect notes here..."
            />
          </div>
          <div className="form-group col-12">
            <button className="btn btn-outline-success btn-block">
              Add Prospect
            </button>
          </div>
        </div>
      </form>
    )
  }
}

document.addEventListener('turbolinks:load', () => {
  const app = document.getElementById('create-prospect')
  app && ReactDOM.render(<ProspectForm />, app)
})