# XXZLearning

The code files in this folder are split into files associated with generating training states (ground states of the XXZ Hamiltonian) and testing meshes (meshes of ground
states) that will be used in the learning, and files which perform the machine learning itself and generate a learned phase diagram.

#### Training/Testing Files
<ul>
  <li> <code> Ham_XXZ_J3J6.m </code> contains a function to generate the XXZ Hamiltonian with a specified number of qubits and parameters J3/J6 and alpha. </li> 
  <li> <code> XXZtrain.m  </code> </li> generates and saves a training state, which is a ground state of the XXZ Hamiltonian (with specified qubit number/parameters).
  <li> <code> XXZ_test_take2.m  </code> </li> generates and saves a testing mesh, which is an array of XXZ Hamiltonian ground states at different parameters, which
  are linearly spaced horizontally and vertically.
</ul>


