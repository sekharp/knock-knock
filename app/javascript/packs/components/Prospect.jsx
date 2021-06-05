import React from 'react'
import PropTypes from 'prop-types'
import axios from "axios";
import setAxiosHeaders from "./AxiosHeaders";

class Prospect extends React.Component {
  constructor(props) {
    super(props);
    this.handleDestroy = this.handleDestroy.bind(this);
    this.path = `/api/v1/prospects/${this.props.prospect.id}`;
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
            className="form-control"
            id={`prospect__name-${prospect.id}`}
          />
        </td>
        <td>
          <input
            type="text"
            defaultValue={prospect.email}
            className="form-control"
            id={`prospect__email-${prospect.id}`}
          />
        </td>
        <td>
          <input
            type="text"
            defaultValue={prospect.notes}
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