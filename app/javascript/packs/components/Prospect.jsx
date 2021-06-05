import React from 'react'
import PropTypes from 'prop-types'
import axios from "axios";
import setAxiosHeaders from "./AxiosHeaders";

class Prospect extends React.Component {
  constructor(props) {
    super(props);
    this.handleDestroy = this.handleDestroy.bind(this);
    this.path = `/api/v1/prospects/${this.props.prospect.id}`;
    this.handleChange = this.handleChange.bind(this);
    this.updateProspect = this.updateProspect.bind(this);
    this.nameInputRef = React.createRef();
    this.emailInputRef = React.createRef();
    this.notesInputRef = React.createRef();
  }

  handleChange() {
    this.updateProspect();
  }

  updateProspect() {
    setAxiosHeaders();
    axios
      .put(this.path, {
        prospect: {
          name: this.nameInputRef.current.value,
          email: this.emailInputRef.current.value,
          notes: this.notesInputRef.current.value,
        }
      })
      .then(response => {})
      .catch(error => {
        console.log(error);
      });
  }

  handleDestroy() {
    setAxiosHeaders();
    const confirmation = confirm("Are you sure?");
    if (confirmation) {
      axios
        .delete(this.path)
        .then(response => {
          this.props.getProspects();
        })
        .catch(error => {
          console.log(error);
        });
    }
  }

  render() {
    const { prospect } = this.props
    return (
      <tr>
        <td>
          <input
            type="text"
            defaultValue={prospect.name}
            onChange={this.handleChange}
            ref={this.nameInputRef}
            className="form-control"
            id={`prospect__name-${prospect.id}`}
          />
        </td>
        <td>
          <input
            type="text"
            defaultValue={prospect.email}
            onChange={this.handleChange}
            ref={this.emailInputRef}
            className="form-control"
            id={`prospect__email-${prospect.id}`}
          />
        </td>
        <td>
          <input
            type="text"
            defaultValue={prospect.notes}
            onChange={this.handleChange}
            ref={this.notesInputRef}
            className="form-control"
            id={`prospect__notes-${prospect.id}`}
          />
        </td>
        <td className="text-right">
          <button className="btn btn-outline-danger" onClick={this.handleDestroy}>Delete</button>
        </td>
      </tr>
    )
  }
}

export default Prospect

Prospect.propTypes = {
  prospect: PropTypes.object.isRequired,
  getProspects: PropTypes.func.isRequired
}