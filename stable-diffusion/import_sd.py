from diffusers import StableDiffusionPipeline, EulerDiscreteScheduler
import torch

model_id = "stabilityai/stable-diffusion-2-base"

def version():
    print(f'1.0.0')

def get_stable_diffusion():
    global scheduler
    global pipe
    print(f'Creating Scheduler...')
    scheduler = EulerDiscreteScheduler.from_pretrained(model_id, subfolder="scheduler")
    print(f'Created Scheduler. Creating Pipe...')
    pipe = StableDiffusionPipeline.from_pretrained(model_id, scheduler=scheduler, torch_dtype=torch.float32)
    print(f'Created Pipe.')

def set_pipe_to_cuda():
    global pipe
    pipe = pipe.to("cuda")

def set_pipe_to_cuda_slow():
    global pipe
    pipe = pipe.to("cuda")
    pipe.enable_attention_slicing()