import React from 'react'
import PropTypes from 'prop-types'

class Prospect extends React.Component {
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
          <button className="btn btn-outline-danger">Delete</button>
        </td>
      </tr>
    )
  }
}

export default Prospect

Prospect.propTypes = {
  prospect: PropTypes.object.isRequired,
}