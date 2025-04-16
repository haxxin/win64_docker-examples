import torch

# Check if CUDA is available
if torch.cuda.is_available():
    # Get the number of available GPUs
    num_gpus = torch.cuda.device_count()
    print(f"Number of available GPUs: {num_gpus}")

    # Set the current device
    device = torch.device("cuda:0")  # Use the first GPU
    torch.cuda.set_device(device)

    # Create a tensor and move it to the GPU
    tensor = torch.randn(3, 3)
    gpu_tensor = tensor.to(device)
    # or 
    gpu_tensor = tensor.cuda()

    # Perform operations on the GPU tensor
    result_tensor = torch.matmul(gpu_tensor, gpu_tensor)

    print(f"Result tensor on GPU:\n{result_tensor}")

    # Move the result back to the CPU if needed
    cpu_tensor = result_tensor.cpu()
else:
    print("CUDA is not available.")
